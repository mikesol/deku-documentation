export { onRenderHtml }
import jsdomGlobal from 'jsdom-global'

import postcss from 'postcss'
// import loadConfig from 'postcss-load-config'
import { escapeInject, dangerouslySkipEscape } from 'vike/server'
import { ssr } from '../output/Run'
import cssInput from '../src/styles/tailwind.css?raw'
import prismTomorrow from 'prismjs/themes/prism-tomorrow.min.css?raw'
import prismCore from 'prismjs/components/prism-core.min.js?raw'
import clipboard from 'clipboard/dist/clipboard.min.js?raw'
import tailwindcss from '@tailwindcss/postcss'

async function processCSS(cssInput) {
  // const { plugins, options } = await loadConfig({}, 'postcss.config.js') // Load from config
  const result = await postcss([tailwindcss]).process(cssInput, {
    // plugins
    from: undefined,
    // ...options,
  })
  return result.css
}

async function onRenderHtml(pageContext) {
  jsdomGlobal(undefined, { pretendToBeVisual: true })

  document.getElementsByTagName('html')[0].innerHTML =
    '<head></head><body></body>'

  const cache = ssr(pageContext.Page)()
  const viewHtml = dangerouslySkipEscape(cache.html)

  pageContext.dekuHydrationData = cache

  const cssOutput = await processCSS(cssInput)

  return escapeInject`<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Deku documentation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <style>${dangerouslySkipEscape(cssOutput)}</style>
    <style>${dangerouslySkipEscape(prismTomorrow)}</style>
    <script>${dangerouslySkipEscape(clipboard)}</script>
    <meta name="description" content="Documentation for the purescript-deku web framework">
  </head>
  <body>
    ${viewHtml}
    <script>${dangerouslySkipEscape(prismCore)}</script>
  </body>
</html>`
}
