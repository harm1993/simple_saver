var ProgressBar = require('progressbar.js');

const initProgressBar = () => {
  document.querySelectorAll('.state-bar').forEach((container) => {
    if (!container.querySelector('svg')) {
      if (container.dataset.type === 'line') {
        var bar = new ProgressBar.Line(container, {
          strokeWidth: 4,
          easing: 'easeInOut',
          duration: 1400,
          color: '#EEE',
          trailColor: '#EEE',
          trailWidth: 5,
          svgStyle: { width: '100%', height: '100%' },
          from: { color: '#bfff00' },
          to: { color: '#ff0000' },
          step: (state, bar) => {
            bar.path.setAttribute('stroke', state.color);
          }
        });
      } else if (container.dataset.type === 'circle') {
        var bar = new ProgressBar.Circle(container, {
          strokeWidth: 14,
          easing: 'easeInOut',
          color: '#2A50E9',
          trailColor: '#C6C9D3',
          from: { color: '#2A50E9' },
          to: { color: '#2A50E9' },
          duration: 1400,
          trailWidth: 10,
          svgStyle: { width: '100%', height: '100%' },
          step: (state, bar) => {
            bar.path.setAttribute('stroke', state.color);
          }
        });
      }
      bar.animate(container.dataset.percentage);
    }
  })
}

export { initProgressBar }
