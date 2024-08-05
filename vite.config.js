import path from 'path';
import vike from 'vike/plugin';
import deku from './vite-plugin-vike-deku';
import vercel from 'vite-plugin-vercel';
import { ViteImageOptimizer } from 'vite-plugin-image-optimizer';

export default {
  plugins: [deku(), vike({ prerender: true }), vercel(), ViteImageOptimizer({})],
  resolve: {
    alias: {
      PureScript: path.resolve(__dirname, "output"),
    },
  }
};
