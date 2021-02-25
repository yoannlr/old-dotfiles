syntax on
set noswapfile
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set nocompatible

let g:colorizer_maxlines=500

map te :tabe<Space>
map tp :tabp<Return>
map tn :tabn<Return>
nnoremap <silent> <C-t> :tabnew<CR>

map <S-F11> :Goyo<Return>
map <S-F12> :ColorToggle<Return>

" disable automatic comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remove blank lines at eof
autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePost *.todo !sorttodo %
autocmd! User GoyoLeave source $HOME/.vimrc

let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
