import * as Prism from 'prismjs';
import 'prismjs/components/prism-haskell';
import 'prismjs/components/prism-purescript';
import 'prismjs/components/prism-bash';
import 'prismjs/components/prism-javascript';
import 'prismjs/components/prism-html';
import 'prismjs/plugins/autoloader/prism-autoloader';

export const highlightAll = () => Prism.highlightAll();
export const highlightAllAsync = () => Prism.highlightAll(true);