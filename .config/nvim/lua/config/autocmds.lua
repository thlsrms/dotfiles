-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- This file is automatically loaded by lazyvim.config.init.

-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup("tabline"),
  callback = function()
    vim.opt.showtabline = 0
  end,
  desc = "Force disable tabline",
})

vim.api.nvim_create_autocmd("TabEnter", {
  group = augroup("tabenter_cwd"),
  callback = function()
    vim.cmd("ProjectRoot")
  end,
  desc = "Set cwd Project Root",
})
