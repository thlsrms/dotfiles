return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>nc", "<cmd>Neorg keybind norg core.dirman.new.note<cr>", desc = "Create Note" },
      { "<leader>nr", "<cmd>Neorg return<cr>", desc = "Return" },
      { "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
      { "<leader>nw", ":Neorg workspace ", desc = "Workspace" },
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Current index" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              default_workspace = "default",
              workspaces = {
                default = "/zdrive/Personal/.org",
              },
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extensions = "all",
            },
          },
        },
      })
    end,
  },
}
