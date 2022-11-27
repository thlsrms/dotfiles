vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[au BufNewFile,BufRead *.wgsl set filetype=wgsl]]
