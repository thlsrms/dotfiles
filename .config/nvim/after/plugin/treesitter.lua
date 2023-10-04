if vim.loop.os_uname().sysname == "Windows_NT" then
    -- Make sure llvm is installed and available on PATH
    require 'nvim-treesitter.install'.compilers = { 'clang' }
end

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {  -- {}, -- one of "all" or a list of languages
    },
    sync_install = false, -- install languages synchronously
    ignore_install = {},
    highlight = {
        enable = true,
        -- disable = { "c", "rust" },
        -- addititional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection    = "<leader>gnn",
            node_incremental  = "<leader>gnr",
            scope_incremental = "<leader>gne",
            node_decremental  = "<leader>gnt",
        },
    },

    indent = {
        enable = true
    },

    rainbow = {
        enable = true
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

    textobjects = {
        -- TODO: Change treesitter motion keymaps
        -- NOTE: Make use of helix keymaps ?
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["])"] = "@class.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
                ["]("] = "@class.outer",
            },
            goto_previos_start = {
                ["[]"] = "@function.outer",
                ["[)"] = "@class.outer",
            },
            goto_previos_end = {
                ["[["] = "@function.outer",
                ["[("] = "@class.outer",
            },
        },
        select = {
            enable = true,

            -- Automatically jump forward textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },

    textsubjects = {
        enable = true,
        keymaps = {
            ['<cr>'] = 'textsubjects-smart', -- works in visual mode
        }
    },

    autotag = {
        enable = true,
    },
}
