import { init } from 'ityped'

const initAutoType = () => { 
  const oneElement = document.querySelector('.ityped-cursor')
  init(oneElement, { showCursor: false, strings: ['Nice', 'One' ] });
}

export { initAutoType }
