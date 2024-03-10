return {
  "jonarrien/telescope-cmdline.nvim",
  keys = {
    { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
  },
  config = function()
    require("telescope").load_extension("cmdline")
  end,
}
