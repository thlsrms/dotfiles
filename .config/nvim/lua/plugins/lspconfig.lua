return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>ch",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), {})
        end,
        desc = "Toggle LSP inlay hints",
      },
    },
  },
}
