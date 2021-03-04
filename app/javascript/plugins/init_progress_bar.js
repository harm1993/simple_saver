var ProgressBar = require('progressbar.js');

const initProgressBar = () => {
  document.querySelectorAll('.state-bar').forEach((container) => {
    if (container.dataset.type === 'line') {
      var bar = new ProgressBar.Line(container, {
        strokeWidth: 4,
        easing: 'easeInOut',
        duration: 1400,
        color: '#FFEA82',
        trailColor: '#FAFAF0',
        trailWidth: 5,
        svgStyle: {width: '100%', height: '100%'},
        from: {color: '#bfff00'},
        to: {color: '#ff0000'},
        step: (state, bar) => {
          bar.path.setAttribute('stroke', state.color);
        }
      }); 
    } else if (container.dataset.type === 'circle') {
      var bar = new ProgressBar.Circle(container, {
        strokeWidth: 6,
        easing: 'easeInOut',
        duration: 1400,
        trailWidth: 5,
        svgStyle: null,
        from: {color: '#bfff00'},
        to: {color: '#ff0000'},
        step: (state, bar) => {
          bar.path.setAttribute('stroke', state.color);
        }
      }); 
    }
    bar.animate(container.dataset.percentage);
  })
}

export { initProgressBar }
