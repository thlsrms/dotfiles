vim.cmd [[au BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[au BufNewFile,BufRead *.wgsl set filetype=wgsl]]
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=100 }]]
