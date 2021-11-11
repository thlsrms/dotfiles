" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
vim.api.nvim_set_keymap('n', '<leader>fb', ":lua require('config/telescope').my_buffer()<cr>", {noremap = true})
EOF
