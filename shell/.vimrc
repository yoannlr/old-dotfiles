syntax on
map <F2> <Esc>:tabp<Return>
map <F3> <Esc>:tabn<Return>
set ts=4
set sw=4
set expandtab
map <C-M> <Esc>:!make<Return>

autocmd FileType yml call s:yaml_settings()
autocmd FileType yaml call s:yaml_settings()
function! s:yaml_settings()
    set ts=2
    set sw=2
    set expandtab
endfunction
