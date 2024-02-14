return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              imports = { granularity = { group = "module" } },
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScritps = { enable = true },
                runBuildScripts = true,
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                  ["godot"] = { "derive_godot_class" },
                },
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      },
    },
  },
}
