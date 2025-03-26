import { defineConfig } from 'eslint/config'
import js from '@eslint/js'
import globals from 'globals'
import { includeIgnoreFile } from '@eslint/compat'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const gitignorePath = path.resolve(__dirname, '.gitignore')

export default defineConfig([
  includeIgnoreFile(gitignorePath),
  {
    files: ['{src,renderer,pages}/*.js'],
    plugins: {
      js,
    },
    extends: ['js/recommended'],
    languageOptions: {
      globals: {
        ...globals.browser,
      },
    },
  },
  {
    files: [
      'gen-examples.js',
      'vite-example.config.js',
      'vite-plugin-vike-deku.js',
      'vite.config.js',
    ],
    plugins: {
      js,
    },
    extends: ['js/recommended'],
    languageOptions: {
      globals: {
        ...globals.node, // Use Node.js globals for these files
      },
    },
  },
])
