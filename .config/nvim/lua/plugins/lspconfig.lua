return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<M-p>", false }
    end,
    keys = {
      {
        "<leader>ch",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), {})
        end,
        desc = "Toggle LSP inlay hints",
      },
    },
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
