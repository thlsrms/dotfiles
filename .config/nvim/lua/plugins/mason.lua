local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
  vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
end

require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}

-- Extension to bridge mason.nvim with the lspconfig plugin
mason_lspconfig.setup({
  -- A list of servers to automatically install if they're not alredy installed.
  ensure_installed = {
    "bash-language-server",
    "typescript-language-server",
    "tailwindcss-language-server",
    "emmet-ls",
    "eslint-lsp",
    "rust-analyzer",
    "selene",
    "lua-language-server",
    "python-lsp-server",
    "pyright",
    "sqlls",
    "svelte-language-server",
    "omnisharp",
    "cpptools",
    "codelldb",
    "deno",
    "dockerfile-language-server",
    "html-lsp",
    "css-lsp",
  }
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

mason_lspconfig.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- Default handler
    lspconfig[server_name].setup {
      capabilities = capabilities
    }
  end,

  -- Next, provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require('rust-tools').setup({})
  end,
})
