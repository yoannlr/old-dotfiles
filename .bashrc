# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Infinite history
HISTSIZE= HISTFILESIZE=

# Adapt to window when resized
shopt -s checkwinsize

# Vi mode
set -o vi

# Custom prompt
PS1='\[\033[0;36m\]$(date +%H:%M) \[\033[01;32m\]\u@\h \[\033[01;34m\]\w\[\033[00m\]\n$ '

# Program variables
EDITOR=vim
BROWSER="firefox"
FILEBROWSER="nnn"
TERMINAL="st"

# Aliases
alias ls='ls --color=auto'
alias q='exit'
alias love="$HOME/Software/love-11.2-x86_64.AppImage"
alias lua='lua5.3'
alias f=$FILEBROWSER
alias e=$EDITOR
alias bm="source $HOME/.scripts/bookmarks.sh"
