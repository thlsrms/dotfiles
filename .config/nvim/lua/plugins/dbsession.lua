return {
  {
    "nvimdev/dbsession.nvim",
    event = "VimEnter",
    cmd = { "SessionSave", "SessionLoad", "SessionDelete" },
    keys = {
      { "<leader>qs", "<cmd>Telescope cmdline<cr>SessionSave ", desc = "Save current session" },
      { "<leader>ql", "<cmd>Telescope cmdline<cr>SessionLoad ", desc = "Load saved session" },
      { "<leader>qd", "<cmd>Telescope cmdline<cr>SessionDelete ", desc = "Delete saved session" },
    },
    opts = {
      auto_save_on_exit = false,
    },
  },
}
