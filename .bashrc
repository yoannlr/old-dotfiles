[[ $- != *i* ]] && return

HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=

# history from multiple sessions at the same time
shopt -s histappend

shopt -s checkwinsize

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# allow cycle through completion
bind TAB:menu-complete
bind 'set show-all-if-ambiguous on'

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

prompt() {
	local CODE="$?"
	if [ $CODE -eq 0 ]
	then
		PS1="\u : \W $ "
	else
		PS1="${CODE} | \u : \W $ "
	fi
}

PROMPT_COMMAND=prompt
