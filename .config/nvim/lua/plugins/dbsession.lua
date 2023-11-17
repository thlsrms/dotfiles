return {
  {
    "nvimdev/dbsession.nvim",
    event = "VimEnter",
    cmd = { "SessionSave", "SessionLoad", "SessionDelete" },
    keys = {
      { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save current session" },
      { "<leader>ql", ":SessionLoad ", desc = "Load saved session" },
      { "<leader>qd", ":SessionDelete ", desc = "Delete saved session" },
    },
    opts = {
      auto_save_on_exit = true,
    },
  },
}
