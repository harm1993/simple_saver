var ProgressBar = require('progressbar.js');

const initProgressBar = () => {
  document.querySelectorAll('.progress-bar').forEach((container) => {
    if (container.dataset.type === 'line') {
      var bar = new ProgressBar.Line(container, {
        strokeWidth: 4,
        easing: 'easeInOut',
        duration: 1400,
        color: '#FFEA82',
        trailColor: '#FAFAF0',
        trailWidth: 5,
        svgStyle: {width: '100%', height: '100%'},
        from: {color: '#00FF00'},
        to: {color: '#ED6A5A'},
        step: (state, bar) => {
          bar.path.setAttribute('stroke', state.color);
        }
      }); 
    } else if (container.dataset.type === 'circle') {
      var bar = new ProgressBar.Circle(container, {easing: 'easeInOut'});
    }
    bar.animate(container.dataset.percentage);
  })
}

export { initProgressBar }