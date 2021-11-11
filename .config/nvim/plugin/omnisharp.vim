let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_stdio = 1

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)

    autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Navigate up and down by method/property/field
    autocmd FileType cs nmap <silent> <buffer> <M-k> <Plug>(omnisharp_navigate_up)
    autocmd FileType cs nmap <silent> <buffer> <M-j> <Plug>(omnisharp_navigate_down)

    autocmd FileType cs nmap <silent> <buffer> <Leader><F2> <Plug>(omnisharp_rename)
augroup END
