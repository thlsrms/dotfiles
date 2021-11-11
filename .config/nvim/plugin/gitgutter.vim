nmap <silent> <M-g>t :GitGutterToggle<CR>
nmap <M-g>n <Plug>(GitGutterNextHunk)
nmap <M-g>p <Plug>(GitGutterPrevHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

let g:gitgutter_sign_allow_clobber = 1
"let g:gitgutter_set_sign_backgrounds = 1

" Custom signs
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '✗'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = 'ww'

autocmd BufWritePost * GitGutter
