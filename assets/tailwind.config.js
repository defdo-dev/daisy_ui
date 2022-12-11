/** @type {import('tailwindcss').Config} */
// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require('tailwindcss/plugin')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  daisyui: {
    themes: [
      {
        defdo_light: {
          "primary": "#F9BC02",
          "secondary": "#ff962b",
          "accent": "#ff91af",
          "neutral": "#1e1d35",
          "base-100": "#FCFCFC",
          "info": "#9ad4f4",
          "success": "#a3e635",
          "warning": "#fde047",
          "error": "#f32c3f",
        },
        defdo_dark: {
          "primary": "#F9BC02",
          "secondary": "#ff962b",
          "accent": "#ff91af",
          "neutral": "#1e1d35",
          "base-100": "#32323C",
          "info": "#9ad4f4",
          "success": "#a3e635",
          "warning": "#fde047",
          "error": "#f32c3f",
        },
      },
    ],
  },
  theme: {
    extend: {
      fontFamily: {
        headline: ["Saira Condensed", "System-ui"],
        mono: ["JetBrains Mono"]
      },
      screens: {
        xs: '340px',
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("daisyui"),
    plugin(({ addVariant }) => addVariant('phx-no-feedback', ['&.phx-no-feedback', '.phx-no-feedback &'])),
    plugin(({ addVariant }) => addVariant('phx-click-loading', ['&.phx-click-loading', '.phx-click-loading &'])),
    plugin(({ addVariant }) => addVariant('phx-submit-loading', ['&.phx-submit-loading', '.phx-submit-loading &'])),
    plugin(({ addVariant }) => addVariant('phx-change-loading', ['&.phx-change-loading', '.phx-change-loading &']))
  ]
}
