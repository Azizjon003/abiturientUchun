import { Scenes } from "telegraf";
import prisma from "../../prisma/prisma";
const scene = new Scenes.BaseScene("type");

scene.hears(["Grant", "Kontrakt"], async (ctx: any) => {
  const text = ctx.message.text?.trim();
  const user = await prisma.user.findFirst({
    where: {
      telegram_id: String(ctx.from.id),
    },
  });
  if (!user) {
    return ctx.reply("Foydalanuvchi mavjud emas");
  }

  const request = await prisma.request.findFirst({
    where: {
      user_id: user.id,
    },
    orderBy: {
      created_at: "desc",
    },
  });

  if (!request) {
    return ctx.reply("Sizning so'rovingiz mavjud emas");
  }
  let datas;
  if (text === "Grant") {
    datas = await prisma.request.update({
      where: {
        id: request.id,
      },
      data: {
        type: "grant",
      },
    });
  }
  if (text === "Kontrakt") {
    datas = await prisma.request.update({
      where: {
        id: request.id,
      },
      data: {
        type: "contract",
      },
    });
  }
  console.log(datas);
  ctx.reply("🆔 Iltimos, AbituriyentId raqamingizni kiriting:");

  return await ctx.scene.enter("abiturient");
});

export default scene;
