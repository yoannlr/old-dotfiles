# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Infinite history
HISTSIZE= HISTFILESIZE=

# Adapt to window when resized
shopt -s checkwinsize

# Custom prompt
PS1='\[\033[0;36m\]$(date +%H:%M) \[\033[01;32m\]\u@\h \[\033[01;34m\]\w\[\033[00m\]\n$ '

# Aliases
alias ls='ls --color=auto'
alias q='exit'
alias love='/home/wink/Software/love-11.2-x86_64.AppImage'

# Editor, for ctrl+x+e
EDITOR=vim
BROWSER="firefox"
FILEBROWSER="nnn"
TERMINAL="xterm"
