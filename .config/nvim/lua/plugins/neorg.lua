return {
  {
    "nvim-neorg/neorg",
    event = "VimEnter",
    version = "*",
    dependencies = {
      "vhyrro/luarocks.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neorg/lua-utils.nvim",
    },
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
          ["core.summary"] = {},
          ["core.tempus"] = {},
          ["core.ui"] = {},
          ["core.ui.calendar"] = {},
          ["core.keybinds"] = {
            config = {
              hook = function(keybinds)
                keybinds.map("norg", "n", "M", "<cmd>Neorg inject-metadata<cr>")
              end,
            },
          },
        },
      })
    end,
  },
}
