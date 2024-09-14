import { Scenes } from "telegraf";
import prisma from "../../prisma/prisma";
const scene = new Scenes.BaseScene("admin");
scene.hears(["/start", "Bosh menyu"], async (ctx: any) => {
  return await ctx.scene.enter("admin");
});

scene.hears("Foydalanuvchilarga xabar yuborish", async (ctx: any) => {
  ctx.reply(
    "Iltimos, barcha foydalanuvchilarga yubormoqchi bo'lgan xabaringizni yozing:"
  );
  ctx.scene.session.awaitingBroadcastMessage = true;
});

const sleep = async (ms: number) =>
  new Promise((resolve) => setTimeout(resolve, ms));

scene.on("message", async (ctx: any) => {
  if (ctx.scene.session.awaitingBroadcastMessage) {
    const broadcastMessage = ctx.message.text;
    // Barcha foydalanuvchilarga xabar yuborish logikasi
    // Bu yerda ma'lumotlar bazangizdan barcha foydalanuvchilar ro'yxatini olishingiz kerak
    const allUsers: any = await prisma.user.findMany(); // Bu ro'yxatni o'zingizning ma'lumotlar bazangizdan to'ldirishingiz kerak

    let successCount = 0;
    let failCount = 0;

    for (const userId of allUsers) {
      try {
        await ctx.telegram.sendMessage(userId.telegram_id, broadcastMessage);
        successCount++;
        await sleep(1000); // Botni qulay ishlash uchun 1 sekundlik faol kut
      } catch (error) {
        failCount++;
        console.error(
          `Failed to send message to user ${userId.telegram_id}:`,
          error
        );
      }
    }

    ctx.reply(
      `Xabar yuborish yakunlandi:\nMuvaffaqiyatli: ${successCount}\nMuvaffaqiyatsiz: ${failCount}`
    );
    ctx.scene.session.awaitingBroadcastMessage = false;
  } else {
    // Boshqa admin buyruqlarini qayta ishlash
  }
});

export default scene;
