export { onRenderClient }

import { hydrate } from '../output/Run'
import { defineCustomElements } from 'wc-discord-message/loader/index.es2017.mjs'
defineCustomElements(window)

let dekuRoute

async function onRenderClient(pageContext) {
  if (pageContext.isHydration) {
    // discards unsubscribe
    const { routing } = hydrate(pageContext.dekuHydrationData)(
      pageContext.Page,
    )()
    dekuRoute = routing
  } else {
    dekuRoute(pageContext.Page)()
  }
}
