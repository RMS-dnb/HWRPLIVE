const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './index.html',
    './src/**/*.{vue,js,ts,jsx,tsx}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'crock': ['crock', 'serif'],
      },
      colors: {
        'telegram': {
          text: '#4f4a2c',
          border: '#49452b',
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    function({ addUtilities }) {
      const newUtilities = {
        '.shadow-text': {
          'text-shadow': '1px 1px 2px rgba(0, 0, 0, 0.5)',
        },
      }
      addUtilities(newUtilities, ['responsive', 'hover'])
    }
  ]
}