call plug#begin('~/.local/share/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier', { 'do': 'npm install' , 'branch' : 'release/1.x' }
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-fugitive'

"Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
call plug#end()

" Set theme
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_statusline_style = 'default'
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
autocmd vimenter * ++nested colorscheme gruvbox-material

" General remaps
noremap <Space> <Nop>
let mapleader = "\<Space>"
" How tab behaves while picking auto complete
let g:SuperTabMappingForward = '<S-Tab>'
let g:SuperTabMappingBackward = '<Tab>'

" Navigation Tabs
map <silent> <M-t>h :tabr<cr>
map <silent> <M-t>s :tabl<cr>
map <silent> <M-t>t :tabp<cr>
map <silent> <M-t>n :tabn<cr>

" Navigation Splits
nnoremap <M-s>t <C-W><C-J>
nnoremap <M-s>n <C-W><C-K>
nnoremap <M-s>s <C-W><C-L>
nnoremap <M-s>h <C-W><C-H>

" Dvorak remaps
noremap h <left>
noremap t <down>
noremap n <up>
noremap s <right>
noremap k n
noremap K N
noremap j s
noremap J S
noremap l t
noremap L T
map S $
map H ^
map - %

" Move lines up and down
nmap <silent> <M-Down> :m +1<CR>
nmap <silent> <M-Up> :m -2<CR>

" Toggle relative line number
nmap <C-L><C-L> :set norelativenumber<CR>
nmap <C-L><C-R> :set relativenumber<CR>

" Trim whitespace on file save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
