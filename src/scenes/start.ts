import { Scenes } from "telegraf";
import enabled from "../utils/enabled";
import { keyboards } from "../utils/keyboards";
const scene = new Scenes.BaseScene("start");

export let keyboard = [
  ["⚖️ Kirish imkoniyatingizni baholash"],
  ["Yordam 🆘"],
  ["Mandatni tahlil qilish"],
];
export let admin_keyboard = [["Admin"]];

scene.enter(async (ctx: any) => {
  const user_id = ctx.from?.id;

  const user_name = ctx.from?.first_name || ctx.from?.username;

  const enable = await enabled(String(user_id), String(user_name));

  if (enable === "one" || enable === "four") {
    ctx.telegram.sendMessage(
      user_id,
      `Assalomu alaykum, aziz abituriyent! 👋

Oliy ta'lim muassasalariga kirish imtihonlari natijalarini tahlil qiluvchi botimizga xush kelibsiz. 🎓

Bu bot sizga quyidagi imkoniyatlarni taqdim etadi:
1. O'tgan yilgi qabul ballari bilan taqqoslash 📊
2. Erishgan ballaringizga ko'ra sizga mos yo'nalishlarni aniqlash 🔍
3. Kirish imkoniyatingizni baholash ⚖️

Boshlash uchun, iltimos, quyidagi ma'lumotlarni kiriting:
- AbituriyentId raqamingizni 🆔 (Biz sizning balingiz va yo'nalishingizni aniqlash uchun kerak bo'ladi)
- Qiziqqan OTMni tanlang 🏫


Biz ma'lumotlarni tahlil qilish uchun mandat.uzbmb.uz saytidan foydalanamiz.Ma'lumotlar tahlili 2023-yildagi kirish ballari bilan amalga oshiriladi.
Omad tilaymiz! 🍀🌟`,
      keyboards(keyboard)
    );

    console.log("start scene");
    return await ctx.scene.enter("control");
  } else if (enable === "two") {
    const text = "Assalomu alaykum Admin xush kelibsiz";

    ctx.telegram.sendMessage(user_id, text, keyboards(admin_keyboard));
    return await ctx.scene.enter("admin");
  } else if (enable === "three") {
    ctx.telegram.sendMessage(
      user_id,
      "Assalomu alaykum.Kechirasiz siz admin tomonidan bloklangansiz"
    );
    return;
  }
});

export default scene;
