require('which-key').setup {
    plugins = {
        marks = true,
        registers = false,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {
        ["<space>"] = "SPC",
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+ ",
    },
    popup_mappings = {
        scroll_down = '<C-d>',
        scroll_up = '<C-f>',
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center", -- left, center, right
    },
    ignore_missing = true, -- hide mappings without label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = false,
    triggers = { "<leader>", "g", "z" }, -- "auto"
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    }
}

local wk = require("which-key")

wk.register({
    -- To ignore a bind : "which_key_ignore"
    -- single
    ["+"] = { '<cmd>vertical resize +2<cr>', 'Resize +2' },
    ["-"] = { '<cmd>vertical resize -2<cr>', 'Resize -2' },
    ["="] = { '<C-W>=', 'Balance windows' },
    ["f"] = { '<cmd>Telescope find_files<cr>', 'Open file picker' },
    ["F"] = { '<cmd>Telescope file_browser<cr>', 'Open file browser' },
    ["l"] = { '<cmd>Telescope live_grep<cr>', 'Find a file with ripgrep' },
    ["b"] = { '<cmd>Telescope buffers<cr>', 'Open buffer picker' },
    ["s"] = { '<cmd>Telescope lsp_document_symbols<cr>', 'Open symbol picker' },
    ["S"] = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Open workspace symbol picker' },
    ["'"] = { '<cmd>Telescope resume<cr>', 'Open last picker' },
    ["\""] = { '<cmd>Telescope pickers<cr>', 'List used pickers' },
    ["j"] = { '<cmd>Telescope jumplist<cr>', 'List items from jumplist' },
    ["a"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'LSP Code actions' },
    ["r"] = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'LSP Rename symbol' },
    ["k"] = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'LSP Hover' },
    ["W"] = { '<cmd>write<cr>', 'Write file' },
    o = {
        name = "Settings",
        n = { '<cmd>set nonumber!<cr>', 'Line numbers' },
        r = { '<cmd>set norelativenumber!<cr>', 'Relative number' },
        w = { '<cmd>set nowrap!<cr>', 'Toggle wrap' },
        p = { '<cmd>NoNeckPain<cr>', 'Toggle NoNeckPain' },
    },
    w = {
        name = "Window",
        h = { '<C-w>h', 'Jump to the split to the left' },
        H = { '<C-w>H', 'Move split to the left' },
        j = { '<C-w>j', 'Jump to the split below' },
        J = { '<C-w>J', 'Move split below' },
        k = { '<C-w>k', 'Jump to the split above' },
        K = { '<C-w>K', 'Move split above' },
        l = { '<C-w>l', 'Jump to the split to the right' },
        L = { '<C-w>L', 'Move split to the right' },
        q = { '<cmd>bd<cr>', 'Close current buffer' },
        r = { '<C-W>v', 'Split right' },
        d = { '<C-W>s', 'Split below' },
    },
    g = {
        name = "Git",
        s = {
            name = "Stage",
            h = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
            b = { '<cmd>Gitsigns stage_buffer<cr>', 'Stage buffer' },
        },
        r = {
            name = "Reset",
            h = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
            b = { '<cmd>Gitsigns resett_buffer<cr>', 'Reset bufer' },
        },
        u = {
            name = "Undo Stage",
            h = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Undo stage hunk' },
        },
        p = { '<cmd>Gitsigns preview_hunk<cr>', 'Preview hunk' },
        d = { '<cmd>Gitsigns diffthis<cr>', 'Diff index' },
        b = { '<cmd>Gitsigns blame_line<cr>', 'Blame line' },
        l = { '<cmd>Gitsigns toggle_current_line_blame<cr>', 'Toggle current line blame' },
        t = { '<cmd>Gitsigns toggle_deleted<cr>', 'Toggle deleted' },
    },
    t = {
        name = "Diagnostics",
        t = { '<cmd>TroubleToggle<cr>', 'Toggle' },
        w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Workspace diagnostics' },
        d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Document diagnostics' },
        q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix list' },
        l = { '<cmd>TroubleToggle loclist<cr>', 'Loclist' },
        g = {
            name = "Goto",
            d = { '<cmd>TroubleToggle lsp_definitions<cr>', 'Definitions' },
            y = { '<cmd>TroubleToggle lsp_type_definitions<cr>', 'Type definitions' },
            r = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
            i = { '<cmd>TroubleToggle lsp_implementations<cr>', 'Implementations' },
        },
    },
    x = {
        name = "Todo",
        x = { '<cmd>TodoTrouble<cr>', 'List TODOs: Trouble' },
        t = { '<cmd>TodoTelescope<cr>', 'List TODOs: Telescope' },
    },
}, { prefix = "<leader>" })

wk.register({
    g = {
        name = "Git",
        s = {
            name = "Stage",
            h = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
        },
        r = {
            name = "Reset",
            h = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
        },
        i = { '<cmd>Gitsigns select_husnk<cr>', 'Select hunk' },
    }
}, { prefix = "<leader>", mode = "v" })

wk.register({
    ["g"] = { 'gg', 'First line' },
    ["e"] = { 'G', 'Last line' },
    ["w"] = { "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<cr>", 'Open Link' },
    ["d"] = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
    ["y"] = { '<cmd>TroubleToggle lsp_type_definitions<cr>', 'Type definition' },
    ["r"] = { '<cmd>TroubleToggle lsp_references<cr>', 'References' },
    ["i"] = { '<cmd>TroubleToggle lsp_implementations<cr>', 'Implementations' },
    ["n"] = { '<cmd>bnext<cr>', 'Next buffer' },
    ["p"] = { '<cmd>bprevious<cr>', 'Previous buffer' },
    ["t"] = { 'H', 'Window top' },
    ["m"] = { 'M', 'Window center' },
    ["b"] = { 'L', 'Window bottom' },
}, { prefix = "g" })

wk.register({
    ["z"] = { 'zz', 'Align view center' },
    ["t"] = { 'z+', 'Align view top' },
    ["b"] = { 'z-', 'Align view bottom' },
    ["u"] = { '<C-b>', 'Move page up' },
    ["k"] = { '<C-f>', 'Move page down' },
    ["h"] = { '<C-u>', 'Move half page up' },
    ["m"] = { '<C-d>', 'Move half page down' },
}, { prefix = "z" })
