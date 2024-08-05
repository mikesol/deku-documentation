export { onRenderClient };

import { hydrate } from "../output/Run";
import "../src/styles/tailwind.css";

async function onRenderClient(pageContext) {
  if (pageContext.isHydration) {
    // discards unsubscribe
    const { routing } = hydrate(pageContext.dekuHydrationData)(pageContext.Page)();
    window.__dekuRoute = routing;
  } else {
    window.__dekuRoute(pageContext.Page)();
  }
}
