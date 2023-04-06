local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

local function use(plugin)
    table.insert(plugins, plugin)
end

use { 'nvim-lua/plenary.nvim' }

-- Treesitter
use { 'nvim-treesitter/nvim-treesitter',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'RRethy/nvim-treesitter-textsubjects' },
    },
    build = ':TSUpdate',
}
use { 'nvim-treesitter/nvim-treesitter-context',
    dependencies = "nvim-treesitter",
    config = function()
        require("treesitter-context").setup {}
    end
}

-- LSP
use { 'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                { 'onsails/lspkind-nvim' }, -- Add pictograms to lsp
                { 'hrsh7th/cmp-nvim-lua' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-calc' },
                { 'hrsh7th/cmp-vsnip' },
                { 'hrsh7th/vim-vsnip' },
                { 'hrsh7th/vim-vsnip-integ' },
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            },
            event = 'InsertEnter',
        },
    }
}

--use { 'tzachar/cmp-tabnine', dependencies = "nvim-cmp", build = './install.sh', lazy = true }
use { 'j-hui/fidget.nvim' }

-- Debug
-- TODO: Configure dap
--use {'mfussenegger/nvim-dap', config = "require('plugins.dap')"}
--use {'rcarriga/nvim-dap-ui', dependencies = 'mfussenegger/nvim-dap'}

-- Telescope
use { 'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
    },
}

-- Themes
use { 'rebelot/kanagawa.nvim' }
use { 'luisiacc/gruvbox-baby' } -- colorscheme
use { 'kyazdani42/nvim-web-devicons',
    config = function()
        require("nvim-web-devicons").setup {}
    end
}

use { 'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
}

-- Git
use { 'lewis6991/gitsigns.nvim',
    version = 'v0.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "BufRead",
}
use { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' }
use { 'tpope/vim-fugitive' }

-- -- Language specifics
-- Rust
use { 'simrat39/rust-tools.nvim' }

-- -- General -- --
use { 'windwp/nvim-ts-autotag', dependencies = 'nvim-treesitter' }
use { 'windwp/nvim-autopairs',
    dependencies = { 'nvim-treesitter', 'nvim-cmp' },
}

use { 'folke/which-key.nvim',
    event = "BufWinEnter",
}

use { 'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
        require("trouble").setup {}
    end
}

use { 'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        require("todo-comments").setup {}
    end
}

use { 'NvChad/nvim-colorizer.lua',
    config = function()
        require("colorizer").setup {}
    end
}

use { 'shortcuts/no-neck-pain.nvim', version = '*' }

require('lazy').setup(plugins)
