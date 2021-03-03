var ProgressBar = require('progressbar.js');

const initProgressBar = () => {
  document.querySelectorAll('.progress-bar').forEach((container) => {
    if (container.dataset.type === 'line') {
        var bar = new ProgressBar.Line(container, {easing: 'easeInOut'}); 
    } else if (container.dataset.type === 'circle') {
        var bar = new ProgressBar.Circle(container, {easing: 'easeInOut'});
    }
    bar.animate(container.dataset.percentage);
  })
}

export { initProgressBar }
