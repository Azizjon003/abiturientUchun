require("dotenv").config();
import { Context, Middleware } from "telegraf";
import { SceneContext } from "telegraf/typings/scenes";
import prisma from "../prisma/prisma";
import bot from "./core/bot";
import session from "./core/session";
import stage from "./scenes/index";
import botStart from "./utils/startBot";

bot.use(session);

const middleware: Middleware<Context | SceneContext> = (ctx: any, next) => {
  ctx?.session ?? (ctx.session = {});
};

bot.use(stage.middleware());

bot.use((ctx: any, next) => {
  console.log("next", ctx?.session);
  return next();
});

bot.start(async (ctx: any) => {
  return await ctx.scene.enter("start");
});

bot.hears(
  ["Yangi Taqdimot", "Balans", "Do'stlarimni taklif qilish", "Bosh menyu"], //  commandlar bot o'chib qolgan vaziyatda user qayta startni  bosganda javob berish uchun
  async (ctx: any) => {
    ctx.reply("Nomalum buyruq.Qayta /start buyrug'ini bosing");
  }
);

bot.catch(async (err: any, ctx) => {
  const userId = ctx?.from?.id;
  if (userId) {
    await bot.telegram.sendMessage(
      userId,
      "Xatolik yuz berdi. Iltimos qayta urinib ko'ring\n /start buyrug'ini bosib qayta urunib ko'ring"
    );
  }

  console.log(err);
  console.log(`Ooops, encountered an error for ${ctx}`, err);
});

bot.on("inline_query", async (ctx: any) => {
  console.log(ctx.inlineQuery);
  const query = ctx.inlineQuery.query.trim();
  const chatType = ctx.inlineQuery?.chat_type;
  console.log(chatType);
  if (chatType !== "sender") return;

  const university = await prisma.universities.findMany({
    where: {
      name: {
        contains: query,
        mode: "insensitive", // Katta-kichik harflarni hisobga olmaslik uchun
      },
    },
    take: 10, // Faqat 10 ta natija qaytaradi
  });
  const results = university.map((uni) => {
    return {
      type: "article",
      id: uni.id,
      title: uni.name,
      description: uni.name,
      thumb_url: "https://i.postimg.cc/8Pkb3Hc7/photo-2024-07-23-13-45-26.jpg",
      input_message_content: {
        message_text: uni.name,
      },
    };
  });

  // [
  //   {
  //     type: "article",
  //     id: "1",
  //     title: "Test",
  //     input_message_content: {
  //       message_text: "Test",
  //     },
  //   },
  // ]
  await ctx.answerInlineQuery(results);
});
botStart(bot);

process.on("uncaughtException", (error) => {
  console.log("Ushlanmagan istisno:", error, "Sabab:", new Date());
});

process.on("unhandledRejection", (reason, promise) => {
  console.log("Ushlanmagan rad etilgan va'da:", promise, "Sabab:", new Date());
});
