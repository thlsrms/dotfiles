nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nl :NERDTree %<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

let NERDTreeMapOpenInTab='<TAB>'
let NERDTreeMapOpenSplit='S'
" Nerdtree-git-plugin specifics
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
