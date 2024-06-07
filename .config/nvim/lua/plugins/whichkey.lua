return {
  {
    "folke/which-key.nvim",
    opts = function()
      require("which-key").register({
        ["<leader>n"] = {
          name = "+Neorg",
        },
        ["<leader>t"] = {
          name = "+Terminal",
        },
        ["<leader>p"] = {
          name = "+Project",
        },
      })
    end,
  },
}
