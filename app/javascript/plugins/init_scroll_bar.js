import { MiniBar } from "minibarjs";

const initScrollBar = () => {
  new MiniBar('.expenses', ,{

    // or progress
    barType: "default",

    // min size
    minBarSize: 10,

    // always shows scrollbars
    alwaysShowBars: false,

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
    },

    // default classes
    classes: {
      container: "mb-container",
      content: "mb-content",
      track: "mb-track",
      bar: "mb-bar",
      visible: "mb-visible",
      progress: "mb-progress",
      hover: "mb-hover",
      scrolling: "mb-scrolling",
      textarea: "mb-textarea",
      wrapper: "mb-wrapper",
      nav: "mb-nav",
      btn: "mb-button",
      btns: "mb-buttons",
      increase: "mb-increase",
      decrease: "mb-decrease",
      item: "mb-item",
      itemVisible: "mb-item-visible",
      itemPartial: "mb-item-partial",
      itemHidden: "mb-item-hidden"
    }

});
);
}

export { initScrollBar }