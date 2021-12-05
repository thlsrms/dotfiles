set exrc
set guicursor=
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set smartindent
set autoindent
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.local/share/nvim/undodir
set undofile
set termguicolors
set scrolloff=8
set cmdheight=2
set updatetime=100
set noshowmode
set completeopt=menuone,noinsert,noselect,preview
set signcolumn=number
set colorcolumn=110
highlight ColorColumn ctermbg=0 guibg=grey37
highlight! link SignColumn LineNr
set shortmess+=c
set shortmess-=F
set mouse=a
set clipboard^=unnamed,unnamedplus
set background=dark
set ttimeoutlen=100
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set tab length for different languages
"autocmd Filetype dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
