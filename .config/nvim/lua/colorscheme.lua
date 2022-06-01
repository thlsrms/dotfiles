-- Gruvbox material config
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = '1'
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_enable_bold = '1'
vim.g.gruvbox_material_diagnostic_line_highlight = '1'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
--vim.g.gruvbox_material_better_performance = '1'

-- Gruvbox config
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'
vim.g.gruvbox_transparent = true

-- Gruvbox flat config
vim.g.gruvbox_flat_style = 'hard'


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
--vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme gruvbox-material')
--vim.cmd('colorscheme gruvbox-flat')

-- barbar tabline modifications
vim.cmd('hi BufferCurrent guibg=none')
vim.cmd('hi BufferCurrentSign guibg=none')
vim.cmd('hi BufferCurrentIndex guibg=none') 
vim.cmd('hi BufferCurrentMod guibg=none') 
vim.cmd('hi BufferCurrentTarget guibg=none') 
vim.cmd('hi BufferVisibleMod guifg=#ad9415') 
vim.cmd('hi BufferInactiveMod guifg=#ad9415') 


