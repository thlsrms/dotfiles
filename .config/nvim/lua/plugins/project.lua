return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = false,
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
  -- TODO: Add key to add project to list
  config = function(_, opts)
    require("project_nvim").setup(opts)
  end,
}
