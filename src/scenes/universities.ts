import { Scenes } from "telegraf";
import prisma from "../../prisma/prisma";
const scene = new Scenes.BaseScene("universities");

scene.hears("/start", async (ctx: any) => {
  return await ctx.scene.enter("start");
});

scene.on("message", async (ctx: any) => {
  const text = ctx.message.text?.trim();
  const userId = ctx.from.id;
  const user = await prisma.user.findFirst({
    where: {
      id: userId,
    },
  });

  if (!user) {
    return ctx.reply("Iltimos, avval ro'yxatdan o'ting");
  }

  const university = await prisma.universities.findFirst({
    where: {
      name: {
        contains: text,
        mode: "insensitive",
      },
    },
  });

  if (!university) {
    return ctx.reply("Bunday universitet topilmadi");
  }
  const request = await prisma.request.create({
    data: {
      user_id: user.id,
      univer_name: university.name,
    },
  });

  ctx.reply(
    `🎓 *${university.name}*\n` +
      `📌 Endi abituriyent sifatida ro'yxatdan o'tishingiz kerak.\n` +
      `🆔 Iltimos, AbituriyentId raqamingizni kiriting:`,
    {
      parse_mode: "Markdown",
      reply_markup: {
        keyboard: [[{ text: "🔙 Orqaga" }]],
        resize_keyboard: true,
        one_time_keyboard: true,
      },
    }
  );

  return await ctx.scene.enter("abiturient");
});

scene.hears("Admin", async (ctx) => {
  ctx.reply("Admin");
});
export default scene;
