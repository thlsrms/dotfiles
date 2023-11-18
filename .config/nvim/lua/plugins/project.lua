return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = false,
    silent_chdir = false,
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
    },
  },
  keys = {
    { "<leader>pA", "<cmd>AddProject<cr>", desc = "Add Project" },
    { "<leader>fp", false },
    { "<leader>pp", "<cmd>Telescope projects<cr>", desc = "Switch Projects" },
    { "<leader>pR", "<cmd>ProjectRoot<cr>", desc = "Set cwd Project Root" },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
  end,
}
