import { MiniBar } from "minibarjs";

const initScrollBar = () => {
  document.querySelectorAll('.exp-container').forEach((container) => {
    new MiniBar(container, {
      // or progress
      barType: "default",
      // min size
      minBarSize: 10,
      // always shows scrollbars
      alwaysShowBars: true,
      // enables horizontal/vertical scrollbars
      scrollX: true,
      scrollY: true,
      // shows nav buttons
      navButtons: false,
      // scroll amount in pixels
      scrollAmount: 10,
      // MutationObserver API
      mutationObserver: {
        attributes: false,
        childList: true,
        subtree: true
      }
    });
  })
};

export { initScrollBar }


// CALLBACK FUNCTIONS

// new MiniBar('#myContent',{

//     onInit: function() {},
//     onUpdate: function() {},
//     onStart: function() {},
//     onScroll: function() {},
//     onEnd: function() {},

// });

// OTHER OPTIONS

// // scrolls to a specific point
// instance.scrollTo(position, axis);

// // scrolls the content by a certain amount
// instance.scrollBy(amount, axis, duration, easing);

// // scroll to top
// instance.scrollToTop();

// // scroll to bottom
// instance.scrollToBottom();

// // recalculates scollbar sizes and positions
// instance.update();

// // destroys the scrollbar
// instance.destroy();