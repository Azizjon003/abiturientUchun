import axios from "axios";
import Cheerio from "cheerio";
import prisma from "../../prisma/prisma";
export const getFetchData = async (id: string) => {
  const res = await axios({
    method: "post",
    url: "https://mandat.uzbmb.uz/Bakalavr2024/MainSearch",
    headers: {
      accept:
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
      "accept-language": "en-US,en;q=0.9,uz;q=0.8",
      "cache-control": "max-age=0",
      "content-type": "application/x-www-form-urlencoded",
      priority: "u=0, i",
      "sec-ch-ua":
        '"Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"',
      "sec-ch-ua-mobile": "?0",
      "sec-ch-ua-platform": '"Linux"',
      "sec-fetch-dest": "document",
      "sec-fetch-mode": "navigate",
      "sec-fetch-site": "same-origin",
      "sec-fetch-user": "?1",
      "upgrade-insecure-requests": "1",
      cookie:
        ".AspNetCore.Antiforgery.UZ8z2jIqXdQ=CfDJ8KT4Bo0BTQxKkda2RU6eBFtSwGUpEfa7KqRd3SrhfQyiUdu60A2oJhvfh7QD1L2GYopUP2hJdE5Fw_BC5kVFXYLGG1rjriUFuVy0PHH2w1P4gdNjdAAoYzGqvJYn9K5L4BGpg5F9KSN3-4UfCdLBvmM",
      Referer: "https://mandat.uzbmb.uz/Bakalavr2024/Paginate",
    },
    data: `entrantid=${id}&lang=uz&__RequestVerificationToken=CfDJ8KT4Bo0BTQxKkda2RU6eBFsrzOUeW0Qcd3Ud8z8pzsU6kN5g2fRE206KmFKBK9iOLIeAjhsuovKuL25R_3UvWphMIwta3MSP9RV2oGiQZlrYRbilm-_HnT9zoJSFku8ib91MjKdfkJyflV1ZspwTI1Y`,
  });

  const data = res.data;

  // console.log(data);

  const applicants = extractApplicants(data, id);
  console.log(applicants);

  return applicants;
};
function extractApplicants(html: any, id: string) {
  const $ = Cheerio.load(html);
  const applicants: any = [];

  $("table.table-hover tbody tr").each((index, element) => {
    const $tds = $(element).find("td");

    const applicant = {
      id: $tds.eq(0).text().trim(),
      name: $tds.eq(1).text().trim(),
      score: $tds.eq(2).text().trim(),
      detailsLink: $tds.eq(3).find("a").attr("href"),
    };

    applicants.push(applicant);
  });
  const subjects = {
    firstSubject:
      $("input[name='s4subject']").val() ||
      $("select[name='s4subject'] option:selected").text(),
    secondSubject:
      $("input[name='s5subject']").val() ||
      $("select[name='s5subject'] option:selected").text(),
    language:
      $("input[name='edLangId']").val() ||
      $("select[name='edLangId'] option:selected").text(),
  };

  return {
    applicants: applicants.filter((item: any) => item.id == id),
    subjects,
  };
}
const checkUser = async (userId: string, universitet: string) => {
  const userDatas: any = await getFetchData(userId);
  console.log(userDatas);

  if (userDatas.applicants.length === 0) {
    return {
      message: "Bu foydalanuvchi mavjud emas",
    };
  }

  if (userDatas.applicants[0].score === "Qiymatlanmagan!") {
    return {
      message: "Sizning balingiz qiymatlanmagan",
    };
  }

  const userBall = userDatas?.applicants[0];
  const subjectOne = userDatas.subjects.firstSubject;
  const subjectTwo = userDatas.subjects.secondSubject;
  const lang =
    userDatas.subjects.language === "1"
      ? "uz"
      : userDatas.subjects.language === "2"
      ? "ru"
      : "en";

  const universities = await prisma.universities.findFirst({
    where: {
      name: universitet,
    },
  });

  const direction = await prisma.direction.findMany({
    where: {
      first_Science: {
        name: subjectOne,
      },
      second_Science: {
        name: subjectTwo,
      },
    },
  });

  if (direction?.length === 0) {
    return {
      message: "Direction not found",
    };
  }

  const directionId = direction?.map((item) => item.id);

  const general = await prisma.general.findMany({
    where: {
      direction_id: {
        in: directionId,
      },
      univer_id: universities?.id,
      lang: {
        location: lang,
      },
      OR: [
        {
          grandBall: {
            lte: Number(userBall.score.replace(",", ".")),
          },
        },
        {
          // kontraktBall: {
          //   lte: Number(userBall.score.replace(",", ".")),
          // },
        },
      ],
    },

    include: {
      direction: true,
      universities: true,
      lang: true,
      type: true,
    },
  });

  return {
    general,
    ...userDatas,
  };
};
