syntax on
set noswapfile
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0
set nocompatible
colors elflord

map te :tabe<Space>
map tp :tabp<Return>
map tn :tabn<Return>

map <S-F11> :Goyo<Return>

autocmd BufWritePost *.todo !sorttodo.sh %
autocmd! User GoyoLeave source $HOME/.vimrc
