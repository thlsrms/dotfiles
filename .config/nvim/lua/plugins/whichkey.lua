return {
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").add({
        { "<leader>n", group = "Neorg" },
        { "<leader>t", group = "Terminal" },
        { "<leader>p", group = "Project" },
      })
    end,
  },
}
