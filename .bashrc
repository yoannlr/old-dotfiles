#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias bm="source $HOME/.scripts/bookmarks.sh"

PS1='\u : \W $ '
