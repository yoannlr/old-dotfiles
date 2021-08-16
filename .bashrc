[[ $- != *i* ]] && return

# history
HISTFILE="$HOME/.cache/bash_history"
HISTSIZE= HISTFILESIZE=
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%y-%m-%d_%T "

# history from multiple sessions at the same time
shopt -s histappend

shopt -s checkwinsize

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# allow cycle through completion
bind TAB:menu-complete
bind 'set show-all-if-ambiguous on'

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

txt_reset='\[\e[0m\]'
txt_red='\[\e[0;31m\]'
txt_green='\[\e[0;32m\]'

# prompt command, with color and return code
promptcommand() {
	local code="$?"

	# echo this special string to set the window title
	case ${TERM} in
		alacritty|xterm*)
			printf "\033]0;%s\007" "${PWD/#$HOME/\~}"
		;;
	esac

	PS1=""
	if [ $code -eq 0 ]
	then
		PS1+="${txt_green}[\W]${txt_reset} "
	else
		PS1+="${txt_red}[${code} | \W]${txt_reset} "
	fi
}

export PROMPT_COMMAND=promptcommand
