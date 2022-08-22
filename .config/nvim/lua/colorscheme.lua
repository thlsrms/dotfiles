vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = '1'
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_enable_bold = '1'
vim.g.gruvbox_material_diagnostic_line_highlight = '1'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

vim.cmd('colorscheme gruvbox-material')

vim.cmd([[
  augroup ColorSchemes
  autocmd!
  autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=grey20
  autocmd ColorScheme * highlight! link SignColumn LineNr
  augroup end
]])
