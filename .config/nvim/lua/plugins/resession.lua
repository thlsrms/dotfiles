return {
  "stevearc/resession.nvim",
  event = "VimEnter",
  opts = {},
  keys = {
    {
      "<leader>qs",
      mode = { "n" },
      function()
        require("resession").save_tab()
      end,
      desc = "Save session",
    },
    {
      "<leader>ql",
      mode = { "n" },
      function()
        require("resession").load()
      end,
      desc = "Load session",
    },
    {
      "<leader>qd",
      mode = { "n" },
      function()
        require("resession").delete()
      end,
      desc = "Load session",
    },
  },
  config = function()
    require("resession").setup({
      autosave = {
        enabled = true,
        interval = 60,
        notify = false,
      },
      tab_buf_filter = function(tabpage, bufnr)
        local dir = vim.fn.getcwd(-1, vim.api.nvim_tabpage_get_number(tabpage))
        -- ensure dir has trailing /
        dir = dir:sub(-1) ~= "/" and dir .. "/" or dir
        return vim.startswith(vim.api.nvim_buf_get_name(bufnr), dir)
      end,
    })
  end,
}
