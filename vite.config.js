import path from 'path';
import vike from 'vike/plugin';
import deku from './rollup-plugin-vike-deku';

export default {
  plugins: [deku(), vike()],
  resolve: {
    alias: {
      PureScript: path.resolve(__dirname, "output"),
    },
  }
};
