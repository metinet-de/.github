/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
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
          DEFAULT: '#1A5FD9',   // cobalt blue light
          dark: '#5294FF',      // cobalt blue dark
          hover: '#1449B0',
          'dark-hover': '#7AB0FF',
          surface: '#EEF3FC',
          'surface-dark': '#0C1D34',
        },
      },
    },
  },
  plugins: [],
}
