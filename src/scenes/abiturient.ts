import { Context, Markup, Scenes } from "telegraf";
import prisma from "../../prisma/prisma";
import { checkUser } from "./../services/dtm.service";
const scene = new Scenes.BaseScene("abiturient");

scene.hears(["/start", "Bosh menyu"], async (ctx: any) => {
  return await ctx.scene.enter("start");
});

scene.on("message", async (ctx: any) => {
  const text = ctx.message.text?.trim();

  const userId = ctx.from.id;
  const user = await prisma.user.findFirst({
    where: {
      telegram_id: String(userId),
    },
  });
  if (!user) {
    return ctx.reply("Iltimos, avval ro'yxatdan o'ting");
  }

  let requests = await prisma.request.findFirst({
    where: {
      user_id: user.id,
    },
    orderBy: {
      created_at: "desc",
    },
  });

  if (!requests) {
    return ctx.reply("Iltimos, avval universitet tanlang");
  }

  requests = await prisma.request.update({
    where: {
      id: requests.id,
    },
    data: {
      abiturient_id: text,
    },
  });

  if (!requests.abiturient_id) {
    return ctx.reply("Iltimos, AbituriyentId raqamingizni kiriting:");
  }

  const checkUserDatas = await checkUser(
    requests?.abiturient_id,
    requests.univer_name,
    1,
    String(requests?.type) as any
  );

  const message = checkUserDatas?.message;

  if (message) {
    if (message === "Bu foydalanuvchi mavjud emas") {
      return ctx.reply(
        "Bunday foydalanuvchi mavjud emas. Iltimos, to'g'ri kiriting abiturientId raqamingizni:"
      );
    } else if (message === "Sizning balingiz qiymatlanmagan") {
      return ctx.reply(
        "Sizning balingiz qiymatlanmagan.Barcha imtihonlar tugagandan keyin qayta urinib ko'ring"
      );
    } else if (message === "Direction not found") {
      return ctx.reply("Bu yo'nalish shu yil uchun mavjud emas");
    } else if (message === "xatolik yuz berdi") {
      return ctx.reply("Xatolik yuz berdi. Iltimos qayta urinib ko'ring");
    }
  }

  const general = checkUserDatas?.general;
  const userScore = Number(
    checkUserDatas?.applicants[0].score.replace(",", ".")
  );

  const userDatas = checkUserDatas?.applicants;
  const subjects = checkUserDatas?.subjects;
  const count = checkUserDatas.count;
  await prisma.request.update({
    where: {
      id: requests.id,
    },
    data: {
      objects: {
        applicants: userDatas,
        subjects: subjects,
      },
    },
  });

  if (general.length === 0) {
    return ctx.reply("Sizning uchun yo'nalish topilmadi");
  }

  await analyzeAndSendResults(
    ctx,
    general,
    userScore,
    count,
    String(requests?.type) as any,
    userDatas[0].name,
    userDatas[0].id,
    subjects
  );
});

scene.action(/^page_(grant|contract)_(\d+)$/, async (ctx) => {
  const [, type, pageStr] = ctx.match;
  const page = parseInt(pageStr);

  const user = await prisma.user.findFirst({
    where: {
      telegram_id: String(ctx.from.id),
    },
  });

  if (!user) {
    return ctx.answerCbQuery("Iltimos, avval ro'yxatdan o'ting");
  }

  const request: any = await prisma.request.findFirst({
    where: {
      user_id: user.id,
    },
    orderBy: {
      created_at: "desc",
    },
  });

  if (!request) {
    return ctx.answerCbQuery("Iltimos, avval universitet tanlang");
  }

  const userScore = Number(
    request?.objects?.applicants[0].score.replace(",", ".")
  );
  const checkUserData = await checkUser(
    request.abiturient_id,
    request.univer_name,
    page,
    type as "grant" | "contract",
    request.objects
  );

  const count = checkUserData.count;
  const data: UniversityData[] = checkUserData?.general;

  if (data.length === 0) {
    return ctx.answerCbQuery("Bu sahifada ma'lumot yo'q");
  }

  await sendPaginatedResults(
    ctx,
    data,
    page,
    type === "grant",
    count,
    type as "grant" | "contract"
  );
  await ctx.answerCbQuery();
});

interface UniversityData {
  id: number;
  univer_id: number;
  direction_id: number;
  lang_id: number;
  year_id: number;
  type_id: number;
  grandBall: number;
  kontraktBall: number;
  grandPeople: number;
  kontraktPeople: number;
  direction: {
    id: number;
    name: string;
    code: string;
    first_science: number;
    second_science: number;
  };
  universities: {
    id: number;
    name: string;
    location: string;
    createdAt: string;
    updatedAt: string;
  };
  lang: {
    id: number;
    name: string;
    location: string;
    univer_id: number;
  };
  type: {
    id: number;
    name: string;
    location: string;
    univer_id: number;
  };
}

async function sendPaginatedResults(
  ctx: Context,
  data: UniversityData[],
  page: number,
  isGrant: boolean,
  itemsCount: number,
  type: "grant" | "contract"
): Promise<void> {
  const itemsPerPage = 4;
  const paginatedData = data;

  let message = isGrant
    ? "🏆 GRANT asosida kirishingiz mumkin bo'lgan yo'nalishlar:\n\n"
    : "💼 KONTRAKT asosida kirishingiz mumkin bo'lgan yo'nalishlar:\n\n";

  message += `🏫 ${paginatedData[0]?.universities.name}\n\n`;

  for (const item of paginatedData) {
    message += `📚 ${item.direction.name} (${item.direction.code})\n`;
    message += `🌐 ${item.lang.name} | 📅 2023-yil | 📊 ${item.type.name}\n`;
    message += isGrant
      ? `🏅 Grant ball: ${item.grandBall}\n\n`
      : `💰 Kontrakt ball: ${item.kontraktBall}\n\n`;
  }

  const totalPages = Math.ceil(itemsCount / itemsPerPage);

  const keyboard = Markup.inlineKeyboard([
    ...(page > 1
      ? [Markup.button.callback("⬅️ Orqaga", `page_${type}_${page - 1}`)]
      : []),
    ...(page < totalPages
      ? [Markup.button.callback("Oldinga ➡️", `page_${type}_${page + 1}`)]
      : []),
  ]);

  message += `Sahifa: ${page}/${totalPages}`;

  try {
    await ctx.editMessageText(message, { reply_markup: keyboard.reply_markup });
  } catch (error) {
    console.error("Xabarni yangilashda xatolik:", error);
    await ctx.reply(message, keyboard);
  }
}

async function analyzeAndSendResults(
  ctx: Context,
  data: UniversityData[],
  userScore: number,
  itemCount: number,
  type: "grant" | "contract" = "grant",
  name: string,
  id: string,
  subjects: any
): Promise<void> {
  let admissions = data;

  let initialMessage = `🎓 Sizning balingiz: ${userScore} \n AbituriyentId: ${id} \n 1-fan ${subjects.firstSubject} \n 2-fan ${subjects.secondSubject}\n\n`;

  if (admissions.length > 0) {
    initialMessage += `Siz ${itemCount} ta yo'nalishga ${
      type === "contract" ? "Kontrakt" : "Grant"
    } asosida kirishingiz mumkin.\n`;
    await ctx.reply(initialMessage);
    await sendPaginatedResults(
      ctx,
      admissions,
      1,
      type === "grant",
      itemCount,
      type
    );
  } else {
    initialMessage += `Afsuski, sizning balingiz ${
      type === "grant" ? "Grant" : "Kontrakt"
    } asosida o'qish uchun yetarli emas.\n`;
    await ctx.reply(initialMessage);
  }
}

export default scene;
