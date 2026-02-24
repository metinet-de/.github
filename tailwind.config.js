/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'media',
  content: [
    './_layouts/**/*.html',
    './_includes/**/*.html',
    './_posts/**/*.{html,md}',
    './blog/**/*.{html,md}',
    './profile/**/*.{html,md}',
    './*.html',
    './*.md',
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          DEFAULT: '#3b82f6',
          dark: '#60a5fa',
        },
      },
    },
  },
  plugins: [],
}
