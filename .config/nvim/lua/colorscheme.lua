-- Gruvbox config
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'
vim.g.gruvbox_transparent = true


-- Lualine config
local gps = require("nvim-gps")
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename', {gps.get_location, cond = gps.is_available}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Nightfox theme
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      --comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      --functions = "italic",
      keywords = "bold",
      --numbers = "NONE",
      --strings = "NONE",
      types = "italic,bold",
      --variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})
-- nightfox
--vim.cmd('colorscheme nightfox')

-- gruvbox
vim.cmd('colorscheme gruvbox')

-- barbar tabline modifications
vim.cmd('hi BufferCurrent guibg=none')
vim.cmd('hi BufferCurrentSign guibg=none')
vim.cmd('hi BufferCurrentIndex guibg=none') 
vim.cmd('hi BufferCurrentMod guibg=none') 
vim.cmd('hi BufferCurrentTarget guibg=none') 
vim.cmd('hi BufferVisibleMod guifg=#ad9415') 
vim.cmd('hi BufferInactiveMod guifg=#ad9415') 


--[[
if globals.colorscheme == 'nightfly' then
  -- Errors
  vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
  vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);

  -- Warnings
  vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
  vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);

  -- Info & Hints
  vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
  vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);

  -- Cursor line
  vim.highlight.create('CursorLineNR', { guifg = "Yellow", ctermfg = "Yellow", guibg = "None", cterm = "bold" }, false);

  -- Comment in italics
  vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);
end
]]--
