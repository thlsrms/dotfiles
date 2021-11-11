let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
let g:flutter_show_log_on_run = 0

nmap <leader>fsd :CocList FlutterDevices<CR>
nmap <leader>fa :FlutterRun<CR>
nmap <leader>fq :FlutterQuit<CR>
nmap <leader>fr :FlutterHotReload<CR>
nmap <leader>fR :FlutterHotRestart<CR>
nmap <leader>fD :FlutterVisualDebug<CR>
nmap <leader>fs :FlutterSplit<CR>
nmap <leader>fS :FlutterVSplit<CR>
nmap <leader>ft :FlutterTab<CR>
nmap <leader>fd :DartFmt<CR>
