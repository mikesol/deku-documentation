export default {
  plugins: {
    'postcss-import': {},
    tailwindcss: {},
    'postcss-focus-visible': {
      replaceWith: '[data-focus-visible-added]',
    },
    autoprefixer: {},
  },
}
