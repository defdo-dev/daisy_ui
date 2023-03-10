# Daisy UI

`daisy_ui` is a dependency for Daisy UI that makes it easy to add pre-designed UI components to your Elixir-Phoenix application. Daisy UI is built on top of the Tailwind CSS framework, which provides a powerful set of utilities for styling your app.

Installing Daisy UI in your project can be a bit challenging, but we've found a solution that allows you to use it without `daisy_ui` as a dependency. This became possible after the release of {tailwind: "~> 0.1.10"}.

Through experimentation, we discovered that we could build tailwind-cli with the DaisyUI plugin embedded, which solves the hardest part of the installation. In addition, the tailwind Elixir dependency supports arbitrary downloads, which makes it possible to install the wrappers around Daisy UI and turn them into functional components easily.

By following our installation process, you can add Daisy UI to your Elixir-Phoenix application and benefit from the pre-designed UI components without the dependency on `daisy_ui`.

## Instruction to install `daisy_ui`

```bash
mix tailwind.install 'https://storage.defdo.de/tailwind_cli_daisyui/v$version/tailwindcss-$target'
```

then esbuild

```bash
mix esbuild.install --if-missing
```

> 10-March-23 binary downloaded with latest available tailwind 3.2.7 version and daisy-ui 2.51.3;

To configure your theme, add the following to your tailwind.js file. Your theme config should look similar to this:

```
{
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  daisyui: {
    themes: [
      {
        defdo_dark: {
          "primary": "#F9BC02",
          "secondary": "#330054",
          "accent": "#ff91af",
          "neutral": "#f4efea",
          "base-100": "#140021",
          "info": "#9ad4f4",
          "success": "#a3e635",
          "warning": "#fde047",
          "error": "#f32c3f",
        },
      },
    ],
  },
  theme: {},
  plugins: [
    require("@tailwindcss/typography"),
    require("daisyui"),
    // Embeds Hero Icons (https://heroicons.com) into your app.css bundle
    // See `Components.Core.icon/1` for more information.
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "../priv/hero_icons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents({
        "hero": ({ name, fullPath }) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": theme("spacing.5"),
            "height": theme("spacing.5")
          }
        }
      }, { values })
    })
  ]
}
```

To use the icon function component in your Elixir-Phoenix application, you'll need to have the hero plugin installed as specified in the tailwind.config.js file. However, if you're using Phoenix version 1.7.1 or later, you don't need to manually add the hero plugin as it is already included.

If you encounter any issues or want to contribute to the project, feel free to open a pull request or wait for new updates.

Happy coding.

## Libraries and Licenses

This project uses the following third-party libraries:

- [tailwindcss](https://github.com/tailwindlabs/tailwindcss) - Licensed under the MIT License
- [daisyUI](https://github.com/saadeghi/daisyuia) - Licensed under the MIT License
- [Phoenix Framework](https://github.com/phoenixframework/phoenix) - Licensed under the MIT License

For more information about these licenses, please see the LICENSE files in the respective library directories.