import * as path from "path";

const DB = process.env.NODE_ENV === "production"
  ? path.resolve(__dirname, "output-es")
  : path.resolve(__dirname, "output");


export default {
  resolve: {
    alias: {
      PureScript: DB,
    },
  }
};
