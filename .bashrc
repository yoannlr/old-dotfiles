#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# allow cycle through completion
bind TAB:menu-complete
bind 'set show-all-if-ambiguous on'
#bind 'set show-all-if-unmodified on'
#bind 'set menu-complete-display-prefix on'

# aliases
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# restores wal colorscheme
(cat $HOME/.cache/wal/sequences &)

PS1='\u : \W $ '
