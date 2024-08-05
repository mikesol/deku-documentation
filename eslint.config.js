import eslint from "@eslint/js";
import globals from "globals";
export default [
{ignores: [
  'output/**/*',
  'dist/**/*'
],},
  eslint.configs.recommended,
  {
    languageOptions: {
      globals: {
        ...globals.browser
      }
    }
  }
];
