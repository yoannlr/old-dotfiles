#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# aliases
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

PS1='\u : \W $ '
