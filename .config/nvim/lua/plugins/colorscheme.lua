return {
  { "rebelot/kanagawa.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      defaults = {
        autocmds = true,
        keymaps = false,
        options = true,
      },
      colorscheme = function()
        require("kanagawa").setup({
          --transparent = true,
          colors = {
            theme = {
              wave = { ui = { bg = "#202020" } },
              all = {
                ui = { bg_gutter = "none", float = "none" },
              },
            },
          },
          overrides = function(colors)
            local theme = colors.theme
            return {
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },

              -- Borderless Telescope
              TelescopeTitle = { fg = theme.ui.special, bold = true },
              TelescopePromptNormal = { bg = theme.ui.bg },
              TelescopePromptBorder = { fg = theme.ui.bg, bg = theme.ui.bg },
              TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
              TelescopeResultsBorder = { fg = theme.ui.bg, bg = theme.ui.bg },
              TelescopePreviewNormal = { bg = theme.ui.bg },
              TelescopePreviewBorder = { bg = theme.ui.bg, fg = theme.ui.bg },

              -- More uniform colors for the popup menu
              Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg },
              PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
              PmenuSbar = { bg = theme.ui.bg_m1 },
              PmenuThumb = { bg = theme.ui.bg_p2 },
            }
          end,
        })
        vim.cmd("colorscheme kanagawa")

        -- Restyle the colorscheme
        --vim.cmd("hi ColorColumn ctermbg=0 guibg=#2a2a30")
        --vim.cmd("hi CursorLine guifg=NONE ctermfg=NONE guibg=#2a2a30 ctermbg=NONE gui=NONE cterm=NONE")
        vim.cmd("hi DiagnosticSignError guibg=NONE")
        vim.cmd("hi DiagnosticSignWarn  guibg=NONE")
        vim.cmd("hi DiagnosticSignInfo  guibg=NONE")
        vim.cmd("hi DiagnosticSignHint  guibg=NONE")
        vim.cmd("hi GitSignsAdd         guibg=NONE")
        vim.cmd("hi GitSignsChange      guibg=NONE")
        vim.cmd("hi GitSignsDelete      guibg=NONE")
      end,
    },
  },
}
