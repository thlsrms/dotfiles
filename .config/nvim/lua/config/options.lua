-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.autoindent = true
opt.colorcolumn = "101"
opt.concealcursor = "n"
opt.cursorline = false -- Enable highlighting of the current line
opt.errorbells = false
opt.hlsearch = true
opt.incsearch = true
opt.list = false
opt.shell = "/usr/bin/fish"
opt.shiftwidth = 4 -- Size of an indent
opt.showtabline = 0 -- Hide tabline
opt.sidescrolloff = 4
opt.statuscolumn = ""
opt.swapfile = false
opt.tabstop = 4 -- Number of spaces tabs count for
opt.wildignore = "*node_modules/**"
