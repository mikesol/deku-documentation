export default {
  "*/**/*.js": [
    "prettier --write",
    "eslint --fix",
    "eslint",
  ],
  "src/**/*.purs": [
    "purs-tidy format-in-place",
  ],
  "*/**/*.{json,css}": ["prettier --write"]
}
