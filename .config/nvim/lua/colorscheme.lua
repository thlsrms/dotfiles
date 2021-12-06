-- Gruvbox config
-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_statusline_style = 'default'
-- vim.g.gruvbox_material_palette = 'mix'
-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
-- Flat
vim.g.gruvbox_flat_style = 'hard' -- 'dark'
vim.g.gruvbox_italic_comments = true
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_theme = { TabLineSel = { bg = "orange"}}
vim.g.gruvbox_transparent = true

-- Lualine config
local gps = require("nvim-gps")
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-flat',
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

vim.cmd[[colorscheme gruvbox-flat]]

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
