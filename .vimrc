syntax on
set noswapfile
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set nocompatible

map te :tabe<Space>
map tp :tabp<Return>
map tn :tabn<Return>

map <S-F11> :Goyo<Return>
map <S-F12> :ColorToggle<Return>

autocmd BufWritePost *.todo !sorttodo.sh %
autocmd! User GoyoLeave source $HOME/.vimrc
