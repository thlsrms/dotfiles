return {
  "arnamak/stay-centered.nvim",
  keys = {
    {
      "<leader>um",
      function()
        require("stay-centered").toggle()
      end,
      desc = "Toggle Stay Centered",
    },
  },
  config = function()
    require("stay-centered").setup({})
  end,
}
