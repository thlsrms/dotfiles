return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { rust_analyzer = { imports = { granularity = { group = "module" } } } },
    },
  },
}
