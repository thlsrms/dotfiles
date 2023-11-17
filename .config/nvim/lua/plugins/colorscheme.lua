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
          transparent = true,
        })
        vim.cmd("colorscheme kanagawa")

        -- Restyle the colorscheme
        vim.cmd("hi ColorColumn ctermbg=0 guibg=#1C1C1F")
        --vim.cmd("hi CursorLine guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE")
        vim.cmd("hi Pmenu               guibg=NONE")
        vim.cmd("hi SignColumn          guibg=NONE")
        vim.cmd("hi LineNr              guibg=NONE")
        vim.cmd("hi CursorLineNr        guibg=NONE")
        vim.cmd("hi DiagnosticSignError guibg=NONE")
        vim.cmd("hi DiagnosticSignWarn  guibg=NONE")
        vim.cmd("hi DiagnosticSignInfo  guibg=NONE")
        vim.cmd("hi DiagnosticSignHint  guibg=NONE")
        vim.cmd("hi GitSignsAdd         guibg=NONE")
        vim.cmd("hi GitSignsChange      guibg=NONE")
        vim.cmd("hi GitSignsDelete      guibg=NONE")
        vim.cmd("hi TelescopeBorder     guibg=NONE")
      end,
    },
  },
}
