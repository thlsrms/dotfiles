vim.o.background = "dark"

vim.g.gruvbox_baby_background_color = 'dark'
vim.g.gruvbox_baby_transparent_mode = true
vim.g.gruvbox_baby_use_original_palette = true

vim.cmd('colorscheme gruvbox-baby')

vim.cmd([[
  augroup ColorSchemes
  autocmd!
  autocmd ColorScheme * highlight ColorColumn ctermbg=0 guibg=grey20
  autocmd ColorScheme * highlight! link SignColumn LineNr
  augroup end
]])
