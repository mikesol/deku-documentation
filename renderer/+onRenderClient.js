export { onRenderClient }

import { hydrate } from '../output/Run'

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
