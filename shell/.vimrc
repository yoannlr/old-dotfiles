syntax on
set ts=4 sw=4 expandtab
set mouse=
set noswapfile
map <F2> <Esc>:tabp<Return> 
map <F3> <Esc>:tabn<Return> 
map <F4> <Esc>:tabe<Return> 

map <C-M> <Esc>:!make<Return>

autocmd FileType yml call s:yaml_settings()
autocmd FileType yaml call s:yaml_settings()
function! s:yaml_settings()
    set ts=2
    set sw=2
    set expandtab
endfunction
