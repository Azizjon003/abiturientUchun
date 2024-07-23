interface DirectionItem {
  grandBall: number;
  kontraktBall: number;
  grandPeople: number;
  kontraktPeople: number;
}

interface GroupedDirection {
  code: string;
  fullTime: DirectionItem | null;
  partTime: DirectionItem | null;
  distance: DirectionItem | null;
}

interface DirectionData {
  direction: {
    name: string;
    code: string;
  };
  type: {
    name: string;
  };
  grandBall: number;
  kontraktBall: number;
  grandPeople: number;
  kontraktPeople: number;
}

interface Context {
  reply: (text: string, options?: { parse_mode: string }) => Promise<void>;
}

export const sendFormattedMessage = async (
  ctx: Context,
  data: DirectionData[]
): Promise<void> => {
  const groupedData = groupDataByDirection(data);

  for (const [direction, info] of Object.entries(groupedData)) {
    let message = `🎓 ${direction}\n`;
    message += `📚 Kod: ${info.code}\n\n`;

    if (info.fullTime) {
      message += "🏫 *Kunduzgi*\n";
      message += `Grant: ${info.fullTime.grandBall} ball (${info.fullTime.grandPeople} o'rin)\n`;
      message += `Kontrakt: ${info.fullTime.kontraktBall} ball (${info.fullTime.kontraktPeople} o'rin)\n\n`;
    }

    if (info.partTime) {
      message += "🌙 *Sirtqi*\n";
      message += `Kontrakt: ${info.partTime.kontraktBall} ball (${info.partTime.kontraktPeople} o'rin)\n\n`;
    }

    if (info.distance) {
      message += "💻 *Masofaviy*\n";
      message += `Kontrakt: ${info.distance.kontraktBall} ball (${info.distance.kontraktPeople} o'rin)\n\n`;
    }

    await ctx.reply(message, { parse_mode: "Markdown" });
  }
};

const groupDataByDirection = (
  data: DirectionData[]
): Record<string, GroupedDirection> => {
  const grouped: Record<string, GroupedDirection> = {};

  data.forEach((item) => {
    if (!grouped[item.direction.name]) {
      grouped[item.direction.name] = {
        code: item.direction.code,
        fullTime: null,
        partTime: null,
        distance: null,
      };
    }

    const directionItem: DirectionItem = {
      grandBall: item.grandBall,
      kontraktBall: item.kontraktBall,
      grandPeople: item.grandPeople,
      kontraktPeople: item.kontraktPeople,
    };

    if (item.type.name === "Kunduzgi") {
      grouped[item.direction.name].fullTime = directionItem;
    } else if (item.type.name === "Sirtqi") {
      grouped[item.direction.name].partTime = directionItem;
    } else if (item.type.name === "Masofaviy") {
      grouped[item.direction.name].distance = directionItem;
    }
  });

  return grouped;
};

// Foydalanish
// sendFormattedMessage(ctx, data);
