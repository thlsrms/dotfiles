local execute = vim.api.nvim_command

-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
    if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
        print("Installed packer.nvim.")
        is_installed = 1
    end
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

local packer = nil
if not is_installed then return end
if packer == nil then
    packer = require('packer')
    packer.init({
        -- we don't want the compilation file in '~/.config/nvim'
        compile_path = compile_path
    })
end

local use = packer.use

-- Packer can manage itself
use 'wbthomason/packer.nvim'

-- Needed to load first
use {'lewis6991/impatient.nvim', rocks = 'mpack'}
use {'nathom/filetype.nvim'}
use {'nvim-lua/plenary.nvim'}
use {'kyazdani42/nvim-web-devicons'}
use {'glepnir/dashboard-nvim', config = "require('plugins.dashboard')"}

-- Themes
use {'morhetz/gruvbox'}
use {'sainnhe/gruvbox-material'}
use { 'eddyekofo94/gruvbox-flat.nvim' }
use {'EdenEast/nightfox.nvim'}

use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

-- Treesitter
use {'nvim-treesitter/nvim-treesitter',
    config = "require('plugins.treesitter')",
    run = ':TSUpdate'
}
use {'nvim-treesitter/nvim-treesitter-textobjects',
  after = {'nvim-treesitter'}
}
use {'RRethy/nvim-treesitter-textsubjects',
  after = {'nvim-treesitter'}
}

-- Telescope
use {'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope')",
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}
    }
  }
use {'nvim-telescope/telescope-fzf-native.nvim',
  run = 'make'
}
use {'ahmedkhalf/project.nvim',
  config = function() require('project_nvim').setup{} end
}

-- LSP Base
use {'neovim/nvim-lspconfig'}

-- LSP Cmp
use {'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua'}
use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
use {'hrsh7th/cmp-path', after = 'cmp-buffer'}
use {'hrsh7th/cmp-calc', after = 'cmp-path'}
use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc'}
use {'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim',
  config = "require('plugins.cmp-npm')"
}
use {'quangnguyen30192/cmp-nvim-ultisnips', after = 'cmp-npm'}

-- LSP Addons
use {'williamboman/nvim-lsp-installer', after = 'cmp-nvim-lsp', config = "require('lsp.installer')"}
use {'tami5/lspsaga.nvim', config = "require('plugins.saga')"}
use {'onsails/lspkind-nvim'}
use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
use {'nvim-lua/popup.nvim'}
use {'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter'}
use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}

-- General
use {'rcarriga/nvim-notify'}
use {'AndrewRadev/switch.vim'}
use {'AndrewRadev/splitjoin.vim'}
use {'numToStr/Comment.nvim',
  config = "require('plugins.comment')"
}
use {'akinsho/nvim-toggleterm.lua',
  config = "require('plugins.toggleterm')"
}
use {'tpope/vim-speeddating'}
use {'junegunn/vim-easy-align'}
use {'JoosepAlviste/nvim-ts-context-commentstring',
  after = 'nvim-treesitter'
}
use {'folke/todo-comments.nvim'}
use {'phaazon/hop.nvim',
  branch = 'v1',
  config = "require('plugins.hopnvim')"
}
use {'folke/which-key.nvim',
  config = "require('plugins.which-key')",
  event = "BufWinEnter"
}
use {'romgrk/barbar.nvim',
  config = "require('plugins.barbar')"
}
use {'vuki656/package-info.nvim',
  requires = {'MunifTanjim/nui.nvim'},
  config = "require('plugins.package-info')",
  disable = not globals.plugins.package_info.enabled
}
use {'antoinemadec/FixCursorHold.nvim'} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
use { 'axelf4/vim-strip-trailing-whitespace' }

-- Snippets & Language & Syntax
use {'windwp/nvim-autopairs',
  after = {'nvim-treesitter', 'nvim-cmp'},
  config = "require('plugins.autopairs')"
}
use {'windwp/nvim-ts-autotag', after = {'nvim-treesitter'}}
use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
use {'mattn/emmet-vim'}
use {'potatoesmaster/i3-vim-syntax'}
use {'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')"}
use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
use {'SirVer/ultisnips',
  requires = {"honza/vim-snippets"},
  config = "require('plugins.ultisnips')",
  after = 'cmp-nvim-ultisnips'
}
use {'hrsh7th/cmp-vsnip', after = {'nvim-cmp'}}
use {'hrsh7th/vim-vsnip', after = {'cmp-vsnip'}}
use {'hrsh7th/vim-vsnip-integ', after = {'vim-vsnip'}}
use {'lpinilla/vim-codepainter'}
-- VSCode snippets
use {'xabikos/vscode-javascript'}
use { 'simrat39/rust-tools.nvim' } -- To enable more of the features of rust-analyzer
use { 'rust-lang/rust.vim' }

-- Nvim Tree
use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}

-- Debug
-- TODO: Configure dap
-- use {'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"}}
-- use {'mfussenegger/nvim-dap', config = "require('plugins.dap')"}

-- Git
use {'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = "require('plugins.gitsigns')",
  event = "BufRead"
}
use {'sindrets/diffview.nvim'}
