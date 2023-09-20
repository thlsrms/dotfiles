local actions    = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
            prompt_position = "top",
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' 🔍 ',
        color_devicons = true,
        sorting_strategy = "ascending",
        file_previwer = previewers.vim_buffer_cat.new,
        grep_previwer = previewers.vim_buffer_vimgrep.new,
        qflist_previwer = previewers.vim_buffer_qflist.new,
        mappings = {
            i = {
                -- ["<C-x>"] = false,
                ["<C-t>"] = actions.move_selection_next,
                ["<C-n>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-h>"] = actions.cycle_previewers_prev,
            },
            n = {
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-h>"] = actions.cycle_previewers_prev,
            },
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            -- theme = "dropdown",
            -- hijack_netrw = true,
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')
