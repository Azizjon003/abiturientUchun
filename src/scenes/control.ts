import { Scenes } from "telegraf";
const scene = new Scenes.BaseScene("control");

scene.hears(["/start", "Bosh menyu"], async (ctx: any) => {
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

scene.hears("Yordam 🆘", async (ctx) => {
  console.log("Yordam");
  ctx.reply(
    `# Yordam 🆘

Assalomu alaykum! Botimizdan foydalanish bo'yicha qo'llanma:

1️⃣ Ro'yxatdan o'tish:
   - Botni ishga tushiring va "/start" buyrug'ini yuboring.

2️⃣ Universitetni tanlash:
   - Ro'yxatdan o'tgandan so'ng, universitet nomini yozing yoki taklif qilingan ro'yxatdan tanlang.

3️⃣ AbituriyentID kiritish:
   - Tanlov yakunlangandan so'ng sizga berilgan AbituriyentID raqamini kiriting.

4️⃣ Natijalarni ko'rish:
   - Bot sizga kontrakt va grant asosida kirishingiz mumkin bo'lgan yo'nalishlarni ko'rsatadi.
   - Har bir tur uchun alohida xabar yuboriladi.

5️⃣ Sahifalarni ko'rish:
   - Natijalar bir nechta sahifaga bo'lingan bo'lishi mumkin.
   - "Oldinga ➡️" va "⬅️ Orqaga" tugmalaridan foydalanib, barcha natijalarni ko'rishingiz mumkin.

❗️ Muammolar yuzaga kelganda:
   - Agar xato xabarini olsangiz, ko'rsatmalarga rioya qilganingizga ishonch hosil qiling.
   - Agar muammo davom etsa, "/start" buyrug'ini yuborib, jarayonni qaytadan boshlang.

Agar qo'shimcha savollaringiz bo'lsa, iltimos, botdan foydalanishda davom eting. Biz sizga yordam berishdan mamnun bo'lamiz!

Murojaat uchun: @aliqulov_azizjon :)
Omad tilaymiz! 🍀
`,
    {
      parse_mode: "HTML",
    }
  );
});

scene.hears("Mandatni tahlil qilish", async (ctx: any) => {
  ctx.reply(
    "Bu bo'lim hozircha faol emas.\n OTM larni tanlash boshlangandan keyin ishga tushadi bu bo'lim"
  );
});

export default scene;
