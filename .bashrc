[[ $- != *i* ]] && return

HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=
HISTTIMEFORMAT="%Y-%m-%d %T "

# history from multiple sessions at the same time
shopt -s histappend

shopt -s checkwinsize

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# allow cycle through completion
bind TAB:menu-complete
bind 'set show-all-if-ambiguous on'

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

trap 'echo -ne "\033]0;$BASH_COMMAND\007"' DEBUG

prompt() {
	local CODE="$?"
	if [ $CODE -eq 0 ]
	then
		PS1="\033]0;\u : \W\007\u : \W $ "
	else
		PS1="\033]0;\u : \W\007${CODE} | \u : \W $ "
	fi
}

PROMPT_COMMAND=prompt
