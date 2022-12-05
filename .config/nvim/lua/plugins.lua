local execute = vim.api.nvim_command

-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not packer_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
        print("Installed packer.nvim.")
        packer_installed = true
    end
end

local packer = nil
if not packer_installed then return end
if packer == nil then
    packer = require('packer')
    packer.init({
        -- We don't want the compilation file in '~/.config/nvim'
        compile_path = compile_path
    })
end

local use = packer.use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Needed to load first
use { 'lewis6991/impatient.nvim', rocks = 'mpack' } -- Speed up loading Lua modules
use { 'nvim-lua/plenary.nvim' }

-- Treesitter
use { 'nvim-treesitter/nvim-treesitter',
    requires = {
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'RRethy/nvim-treesitter-textsubjects' },
    },
    run = ':TSUpdate',
    config = "require('plugins.treesitter')",
}
use { 'nvim-treesitter/nvim-treesitter-context',
    after = "nvim-treesitter",
    config = function()
        require("treesitter-context").setup {}
    end
}

-- LSP Base
use { 'neovim/nvim-lspconfig' }

-- LSP Addons
use { 'williamboman/mason.nvim', config = "require('plugins.mason')" }
use { 'williamboman/mason-lspconfig.nvim' }
use { 'onsails/lspkind-nvim' } -- Add pictograms to lsp

-- LSP Cmp
use { 'hrsh7th/nvim-cmp',
    requires = {
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-calc' },
        { 'hrsh7th/cmp-vsnip' },
        { 'hrsh7th/vim-vsnip' },
        { 'hrsh7th/vim-vsnip-integ' },
    },
    event = 'InsertEnter',
    config = "require('plugins.cmp')",
}
use { 'tzachar/cmp-tabnine', after = "nvim-cmp", run = './install.sh', opt = true }

-- Debug
-- TODO: Configure dap
--use {'mfussenegger/nvim-dap', config = "require('plugins.dap')"}
--use {'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap'}

-- Telescope
use { 'nvim-telescope/telescope.nvim',
    requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
    },
    config = "require('plugins.telescope')",
}

-- Theme
use { 'luisiacc/gruvbox-baby' } -- colorscheme
use { 'kyazdani42/nvim-web-devicons',
    config = function()
        require("nvim-web-devicons").setup {}
    end
}

use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- Git
use { 'lewis6991/gitsigns.nvim',
    tag = 'v0.5',
    requires = { 'nvim-lua/plenary.nvim' },
    event = "BufRead",
    config = "require('plugins.gitsigns')",
}
use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
-- use {'tpope/vim-fugitive'}

-- -- Language specifics
-- Rust
use { 'simrat39/rust-tools.nvim' }

-- -- General -- --
use { 'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
        require 'hop'.setup { keys = 'aoeuidhtnspygcrljkbmw' }
    end
}

use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
use { 'windwp/nvim-autopairs',
    after = { 'nvim-treesitter', 'nvim-cmp' },
    config = "require('plugins.autopairs')",
}

use { 'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('plugins.which-key')"
}

use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require("trouble").setup {}
    end
}

use { 'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
        require("todo-comments").setup {}
    end
}

use { 'NvChad/nvim-colorizer.lua',
    config = function()
        require("colorizer").setup {}
    end
}
