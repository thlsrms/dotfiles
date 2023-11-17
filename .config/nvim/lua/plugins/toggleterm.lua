return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      { "<C-/>", false },
      { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tn", "<cmd>ToggleTermSetName<cr>", desc = "Rename Terminal" },
      { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select Terminal" },
    },
    opts = {
      open_mapping = [[<C-t>]],
      direction = "float",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
