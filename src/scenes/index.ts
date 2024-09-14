const { Scenes } = require("telegraf");
import abitur from "./abiturient";
import admin from "./admin";
import chooseType from "./chooseType";
import control from "./control";
import start from "./start";
import univer from "./universities";
const stage = new Scenes.Stage([
  start,
  control,
  univer,
  abitur,
  chooseType,
  admin,
]);

export default stage;
