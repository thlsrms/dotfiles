return {
  "nvimdev/dashboard-nvim",
  keys = { { "<leader>uD", "<cmd>Dashboard<cr>", desc = "Dashboard" } },
  opts = function(_, opts)
    local logo = [[lazyVim]]
    opts.config.header = vim.split(logo, "\n", { trimempty = true })
  end,
}
