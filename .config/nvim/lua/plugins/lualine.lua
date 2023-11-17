local Util = require("lazyvim.util")
local evilline_colors = {
  bg = nil,
  fg = "#C8C093",
  yellow = "#FF9E3B",
  cyan = "#7E9CD8",
  darkblue = "#223249",
  green = "#76946A",
  orange = "#FFA066",
  violet = "#957FB8",
  magenta = "#FF5D62",
  blue = "#2D4F67",
  red = "#E82424",
}

local custom_evilline = {
  normal = {
    a = { fg = evilline_colors.fg, bg = evilline_colors.bg },
    b = { fg = evilline_colors.fg, bg = evilline_colors.bg },
    c = { fg = evilline_colors.fg, bg = evilline_colors.bg },
  },
  inactive = {
    a = { fg = evilline_colors.fg, bg = evilline_colors.bg },
    b = { fg = evilline_colors.fg, bg = evilline_colors.bg },
    c = { fg = evilline_colors.fg, bg = evilline_colors.bg },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    --local lualine_require = require("lualine_require")
    --lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = custom_evilline,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = function()
              local mode_color = {
                n = evilline_colors.cyan,
                no = evilline_colors.cyan,
                i = evilline_colors.orange,
                c = evilline_colors.red,
                v = evilline_colors.violet,
                [""] = evilline_colors.violet,
                V = evilline_colors.violet,
                s = evilline_colors.green,
                S = evilline_colors.green,
                [""] = evilline_colors.green,
                ic = evilline_colors.orange,
                R = evilline_colors.red,
                Rv = evilline_colors.red,
                cv = evilline_colors.red,
                ce = evilline_colors.red,
                r = evilline_colors.red,
                rm = evilline_colors.red,
                ["r?"] = evilline_colors.red,
                ["!"] = evilline_colors.magenta,
                t = evilline_colors.magenta,
              }
              return {
                fg = mode_color[vim.fn.mode()],
                gui = "bold",
              }
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            color = {
              fg = evilline_colors.yellow,
              bg = evilline_colors.bg,
            },
          },
        },

        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%R")
            end,
            color = { fg = evilline_colors.magenta },
          },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
