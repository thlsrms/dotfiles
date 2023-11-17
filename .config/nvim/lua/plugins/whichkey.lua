return {
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        ["<leader>t"] = {
          name = "+ToggleTerm",
        },
      })
    end,
  },
}
