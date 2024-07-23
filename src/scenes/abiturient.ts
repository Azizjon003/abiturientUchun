import { Scenes } from "telegraf";
const scene = new Scenes.BaseScene("abiturient");

scene.hears("/start", async (ctx: any) => {
  return await ctx.scene.enter("start");
});

scene.on("message", async (ctx: any) => {
  const text = ctx.message.text?.trim();
});

scene.hears("Admin", async (ctx) => {
  ctx.reply("Admin");
});
export default scene;
