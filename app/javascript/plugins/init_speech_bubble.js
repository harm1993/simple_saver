var rectangle = $("#Rectangle");
var speechBubble = $("#SpeechBubble");

const initSpeechBubble = () => {
rectangle.hover(
  function() {
    speechBubble.css({
      "animation-name": "expand-bounce",
      "animation-duration": "0.25s"
    });
  },
  function() {
    speechBubble.css({
      "animation-name": "shrink",
      "animation-duration": "0.1s"
    });
  }
);
}

export { initSpeechBubble }