return {
  "nvimdev/dashboard-nvim",
  keys = { { "<leader>uD", "<cmd>Dashboard<cr>", desc = "Dashboard" } },
  opts = function(_, opts)
    -- empty space on logo to push the center down
    local logo = [[










    ]]
    local center = {
      {
        action = "Neorg journal today",
        desc = " today's agenda",
        icon = "",
        key = "a",
      },
      {
        action = "Telescope find_files hidden=true",
        desc = " find file",
        icon = " ",
        key = "f",
      },
      {
        action = "ene | startinsert",
        desc = " new file",
        icon = " ",
        key = "n",
      },
      {
        action = "Telescope oldfiles",
        desc = " recent files",
        icon = " ",
        key = "r",
      },
      {
        action = "Telescope live_grep",
        desc = " find text",
        icon = " ",
        key = "g",
      },
      {
        action = "Telescope projects",
        desc = " projects",
        icon = " ",
        key = "p",
      },
      {
        action = [[lua require("lazyvim.util").telescope.config_files()()]],
        desc = " config",
        icon = " ",
        key = "c",
      },
      {
        action = "SessionLoad ",
        desc = " restore session",
        icon = " ",
        key = "s",
      },
      {
        action = "qa",
        desc = " quit",
        icon = " ",
        key = "q",
      },
    }
    opts.config.header = vim.split(logo, "\n")
    opts.config.center = center
  end,
}
