" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Code navigation
nmap <silent> <leader>aj <Plug>(ale_previous_wrap)
nmap <silent> <leader>ak <Plug>(ale_next_wrap)
nmap <silent> <M-j> <Plug>(coc-diagnostic-prev)
nmap <silent> <M-k> <Plug>(coc-diagnostic-next)
nmap <silent> <M-d> <Plug>(coc-definition)
nmap <silent> <M-y> <Plug>(coc-type-definition)
nmap <silent> <M-i> <Plug>(coc-implementation)
nmap <silent> <M-r> <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Snippets
"imap <C-l> <Plug>(coc-snippets-expand)
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" CoC extensions
let g:coc_global_extensions=[
            \ 'coc-omnisharp',
            \ 'coc-snippets',
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-prettier',
            \ 'coc-flutter'
            \]
" ALE options
"let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let g:ale_linters_ignore = {
            \   'typescript': ['tslint'],
            \}

let g:ale_linters = {
            \ 'cs': ['OmniSharp'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['prettier', 'tslint'],
            \ 'scss': ['prettier'],
            \ 'html': ['prettier']
            \}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}


autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>


" For Coc Action Menu to work.
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
