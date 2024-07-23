import { Scenes } from "telegraf";
const scene = new Scenes.BaseScene("control");

scene.hears("/start", async (ctx: any) => {
  return await ctx.scene.enter("start");
});

scene.hears("⚖️ Kirish imkoniyatingizni baholash", async (ctx: any) => {
  ctx.reply("Oliy ta'lim muassasalaridan birini tanlang 🏫", {
    reply_markup: {
      inline_keyboard: [
        [{ text: "Qidirish", switch_inline_query_current_chat: "" }],
      ],
    },
  });

  return await ctx.scene.enter("universities");
});

export default scene;
