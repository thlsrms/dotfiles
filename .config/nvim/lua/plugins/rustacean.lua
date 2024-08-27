return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- Recommended
  ft = { "rust" },
  keys = {
    { "<leader>cL", "<cmd>!leptosfmt .<cr>", mode = { "n" }, desc = "Format leptos view macro" },
  },
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          imports = { granularity = { group = "module" } },
          cargo = { features = { "all" } },
        },
      },
    },
  },
}
