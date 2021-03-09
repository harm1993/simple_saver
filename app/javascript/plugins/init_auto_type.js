import TypeIt from "typeit";

const initAutoType = () => {
  new TypeIt("#type-1", {
    strings: "1. Set categories",
    speed: 75,
    waitUntilVisible: true
  }).go();

  new TypeIt("#type-2", {
    strings: "2. Set your goal",
    speed: 75,
    waitUntilVisible: true
  }).go();

  new TypeIt("#type-hs", {
    strings: "Happy saving!",
    speed: 75,
    waitUntilVisible: true
  }).go();
}

export { initAutoType }
