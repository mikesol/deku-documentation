const DB = process.env.NODE_ENV === "production"
  ? path.resolve(__dirname, "output-es/Main/")
  : path.resolve(__dirname, "output/Main/");


export default {
  resolve: {
    alias: {
      PureScript: DB,
    },
  }
};
