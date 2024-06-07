return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000,
      max_height = function()
        return math.floor(vim.o.lines * 0.10)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.50)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
}
