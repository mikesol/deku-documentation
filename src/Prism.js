import * as Prism from 'prismjs'
import 'prismjs/components/prism-haskell'
import 'prismjs/components/prism-purescript'
import 'prismjs/components/prism-bash'
import 'prismjs/components/prism-javascript'
import 'prismjs/components/prism-markup'
import 'prismjs/plugins/autoloader/prism-autoloader'

export const highlightAll = () => Prism.highlightAll()
export const highlightAllAsync = () => Prism.highlightAll(true)
export const addExpandButton = () => {
  const collection = document.querySelectorAll('code.language-purescript')
  for (let i = 0; i < collection.length; i++) {
    const obj = collection[i]
    const noCollapse = obj.className.includes('no-collapse')
    const x = Node.ELEMENT_NODE
    let check = 0
    let startNode = null
    for (let i = 0; i < obj.childNodes.length; i++) {
      if (check === 3 && obj.childNodes[i].nodeType === Node.ELEMENT_NODE) {
        startNode = obj.childNodes[i]
        break
      }
      if (
        check === 0 &&
        obj.childNodes[i].nodeType === Node.ELEMENT_NODE &&
        obj.childNodes[i].textContent === 'module'
      ) {
        check++
      }
      if (
        check === 1 &&
        obj.childNodes[i].nodeType === Node.ELEMENT_NODE &&
        obj.childNodes[i].textContent === 'Main'
      ) {
        check++
      }
      if (
        check === 2 &&
        obj.childNodes[i].nodeType === Node.ELEMENT_NODE &&
        obj.childNodes[i].textContent === 'where'
      ) {
        check++
      }
    }
    if (startNode) {
      const newSpan = document.createElement('span')
      let prevSib = startNode
      let sib = startNode.nextSibling
      newSpan.appendChild(prevSib)
      while (sib) {
        if (
          sib.nodeType === Node.ELEMENT_NODE &&
          sib.className === 'token hvariable' &&
          sib.textContent === 'main'
        ) {
          break
        }
        prevSib = sib
        sib = sib.nextSibling
        newSpan.appendChild(prevSib)
      }
      newSpan.appendChild(prevSib)
      newSpan.className = noCollapse ? '' : 'hidden'
      if (sib) {
        const icon = document.createElement('button')
        icon.innerHTML = noCollapse ? '-' : '+'
        icon.style.position = 'absolute'
        icon.style.left = '-2em'
        icon.style.top = '-1.5em'
        icon.setAttribute(
          'class',
          `inline-flex items-center rounded-md
        border border-transparent bg-indigo-600 px-2 py-1
        text-sm font-medium leading-4 text-white shadow-sm
        hover:bg-indigo-700 focus:outline-none focus:ring-2
        focus:ring-indigo-500 focus:ring-offset-2`
        )
        let open = noCollapse
        icon.addEventListener('click', () => {
          if (open) {
            open = false
            newSpan.className = 'hidden'
            icon.textContent = '+'
          } else {
            open = true
            newSpan.className = ''
            icon.textContent = '-'
          }
        })
        const div = document.createElement('div')
        div.style.height = '0'
        div.style.width = '0'
        div.style.position = 'relative'
        div.appendChild(icon)
        obj.insertBefore(div, sib)
        obj.insertBefore(newSpan, div)
      } else {
        obj.appendChild(newSpan)
      }
    }
  }
}
