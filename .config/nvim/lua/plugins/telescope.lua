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
        winblend = 10,
        mappings = {
          i = {
            ["<C-S-d>"] = "delete_buffer",
            ["<esc>"] = "close",
          },
        },
      },
    })
  end,
}
