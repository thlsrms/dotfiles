local icons = require('icons')

globals = {
  ui = {
    float = {
      border = 'rounded',
      highlight = 'NightflyRed' -- check available by :Telescope highlights
    }
  },
  plugins = {
    dashboard = {
      fuzzy_plugin = 'telescope' -- telescope/clap/fzf
    },
    package_info = {
      enabled = true
    },
  },
  icons = icons,
}
