return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.stdpath("data") .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
