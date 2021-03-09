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

txt_red="$(tput setaf 1)"
txt_green="$(tput setaf 2)"
txt_bold="$(tput bold)"
txt_reset="$(tput sgr0)"

prompt() {
	local CODE="$?"
	if [ $CODE -eq 0 ]
	then
		PS1="${txt_green}${txt_bold}\u : \W $ ${txt_reset}"
	else
		PS1="${txt_red}${CODE} | ${txt_bold}\u : \W $ ${txt_reset}"
	fi
	echo -ne "\033]0;${USER} : $(basename ${PWD})\007"
}

PROMPT_COMMAND=prompt
