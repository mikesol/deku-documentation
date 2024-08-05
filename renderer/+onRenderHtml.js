export { onRenderHtml };
import jsdomGlobal from "jsdom-global";

import { escapeInject, dangerouslySkipEscape } from "vike/server";
import { ssr } from "../output/Run";

async function onRenderHtml(pageContext) {
  jsdomGlobal(undefined, { pretendToBeVisual: true });
  document.getElementsByTagName("html")[0].innerHTML =
    "<head></head><body></body>";

  const cache = ssr(pageContext.Page)();
  const viewHtml = dangerouslySkipEscape(cache.html);

  pageContext.dekuHydrationData = cache;

  return escapeInject`<!DOCTYPE html>
<html>
  <head>
    <title>Deku documentation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="/src/styles/tailwind.css">
    <link href="/node_modules/prismjs/themes/prism-tomorrow.min.css" rel="stylesheet" />
    <script src="/node_modules/clipboard/dist/clipboard.min.js"></script>
    <script src="/node_modules/prismjs/components/prism-core.min.js" defer></script>
    <script src="https://unpkg.com/wc-discord-message@^2.0.0/dist/wc-discord-message/wc-discord-message.js"></script>
  </head>
  <body>
    ${viewHtml}
  </body>
</html>`;
}
