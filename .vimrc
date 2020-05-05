syntax on
set noswapfile
set ignorecase smartcase
set timeoutlen=1000 ttimeoutlen=0

map te :tabe<Space>
map tp :tabp<Return>
map tn :tabn<Return>

autocmd BufWritePost *.todo !sorttodo.sh %
