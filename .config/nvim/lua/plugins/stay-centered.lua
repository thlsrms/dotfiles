return {
  "arnamak/stay-centered.nvim",
  keys = {
    {
      "<A-c>",
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
