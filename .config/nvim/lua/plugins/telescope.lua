return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 50,
        mappings = {
          n = {
            ["<S-d>"] = "delete_buffer",
          },
          i = {
            ["<C-S-d>"] = "delete_buffer",
          },
        },
      },
    })
  end,
}
