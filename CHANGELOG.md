## 0.2.1

- Starts with phoenix 1.7.2 support.
- Update deps to stay with latests.

## 0.2.0

- Starts with phoenix 1.7.1 support.
- Updated Readme
- Add License and attributions

## 0.1.0

### Enhancements

This is a wrapper and currently we do not support a way to have the motor to work online with your assets, you must add the daisy ui motor on your project, here the instructions. 


> It only works with LiveView 1.18+ it is because it supports the `attr` macro on components.

## Instruction to install daisy UI

### if you are coming from a fresh install (esbuild dependency)

from `mix.exs` remove esbuild dependency, also if you have tailwind dependency remove it.
from `config.exs` remove their configurations.

In `dev.exs` update the Endpoint.watchers node, lo listen the npm executables.

```elixir
  watchers: [
    npm: [
      "run",
      "watch.js",
      cd: Path.expand("../assets", __DIR__)
    ],
    npm: [
      "run",
      "watch.css",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]
```

The previous snipped is a way to configure, where watch.{js,css} definitions, are a declared script into the `package.json` file.

Here is where all your js code is sourced, and using the `esbuild.js` you are able to control de generated output and preserve the result at `priv/static` where is used by phoenix to listen the assets when is running on server mode.

We must install the following npm packages.

`npm i -D esbuild esbuild-copy-static-files`

> Remember you should use the `esbuild.js` from this repository.

Continue with daisy setup.


### if you are coming from an installation with npm.

You are almost ready just continue with daisy setup.


### Daisy UI setup

A pre-requisite is tailwind to install it we also install 

`npm i -D tailwindcss postcss autoprefixer @tailwindcss/typography`

> There are know issues with @tailwindcss/forms since daisy ui implements their own css strategy if you really want to continue be sure your strategy is set as 'class' and patch any detected issue via css overrides


Install the npm package `npm i -D daisyui`.

add to your `tailwind.js` you theme config should looks similar to

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
  theme: {},
  plugins: [
    require("@tailwindcss/typography"),
    require("daisyui"),
  ]
}
```

Feel free to open a PR or wait for new updates.

Happy coding.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## to use custom tailwind + npm follow the next steps.

```bash
npm install -D tailwindcss postcss autoprefixer @tailwindcss/forms @tailwindcss/typography daisyui esbuild esbuild-copy-static-files
```