import path from 'path';
import vike from 'vike/plugin';
import deku from './vite-plugin-vike-deku';
import vercel from 'vite-plugin-vercel';

export default {
  plugins: [deku(), vike({ prerender: true }), vercel()],
  resolve: {
    alias: {
      PureScript: path.resolve(__dirname, "output"),
    },
  }
};
