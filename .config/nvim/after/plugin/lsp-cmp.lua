-- Setup global configuration. More on configuration below
local cmp = require('cmp')

local lspkind = require('lspkind')
local tabnine = require('cmp_tabnine.config')

local source_mapping = {
    buffer = globals.icons.buffer .. '[BUF]',
    calc = globals.icons.calculator,
    cmp_tabnine = globals.icons.light,
    nvim_lsp = globals.icons.paragraph .. '[LSP]',
    nvim_lua = globals.icons.bomb,
    path = globals.icons.folderOpen2,
    treesitter = globals.icons.tree,
    ultilsnips = globals.icons.snippet,
    zsh = globals.icons.terminal .. '[ZSH]',
}

local cmp_opts = {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    -- Mapping settings
    mapping = cmp.mapping.preset.insert({
        ['<up>'] = cmp.mapping.select_prev_item(),
        ['<down>'] = cmp.mapping.select_next_item(),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    }),

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })
            local menu = source_mapping[entry.source.name]
            local maxwidth = 50

            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = menu .. '[' .. entry.completion_item.data.detail .. ']'
                end
            end

            vim_item.menu = menu
            vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

            return vim_item
        end
    },

    -- Specify installed sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'cmp_tabnine', max_item_count = 8 },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'calc' },
        { name = 'nvim_lua' },
    }),

    experimental = {
        native_menu = false,
        ghost_text = true,
    }
}

tabnine:setup({
    max_lines = 500;
    max_num_results = 5;
    sort = true;
    show_prediction_strength = true;
})

cmp.setup(cmp_opts)


--#region LSP
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup_nvim_cmp(cmp_opts)

lsp.set_preferences({
    sign_icons = {
        error = globals.icons.error,
        warn = globals.icons.warningTriangleNoBg,
        hint = globals.icons.lightbulbOutline,
        info = globals.icons.iinfo,
    }
})

lsp.ensure_installed({
    "bashls",
    "tsserver",
    "tailwindcss",
    "emmet_ls",
    "eslint",
    "rust_analyzer",
    "lua_ls",
    "pyright",
    "sqlls",
    "svelte",
    "omnisharp",
    "clangd",
    "dockerls",
    "html",
    "cssls",
    "wgsl_analyzer",
})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'globals' } -- Fix undefined global
            }
        }
    }
})

lsp.configure("clangd", {
    filetypes = {
        "c", "cpp", "objc", "objcpp", "cuda"
    }
})

lsp.configure("rust_analyzer", {
    on_attach = function()
        require('rust-tools').setup({})
    end
})

lsp.setup()
--#endregion

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

require('fidget').setup {} -- lsp progress
