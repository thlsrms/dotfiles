local function winblend()
  if vim.g.neovide then
    return 30
  else
    return 10
  end
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>:", false },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = winblend(),
        mappings = {
          i = {
            ["<C-S-d>"] = "delete_buffer",
            ["<esc>"] = "close",
          },
        },
      },
      extensions = {
        cmdline = {
          overseer = { enabled = false },
        },
      },
    })
  end,
}
