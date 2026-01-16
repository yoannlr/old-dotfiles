# if not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# no history size limit
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored gcc warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# host specific bash aliases
if [ -f ~/.bash_local_aliases ]; then
    . ~/.bash_local_aliases
fi

# bash completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# trailing slash after symlink directories
bind 'set mark-symlinked-directories on'

# allow cycle through completion
bind TAB:menu-complete
bind 'set show-all-if-ambiguous on'

export PATH="${HOME}/.local/bin:/usr/local/go/bin:${PATH}"
export EDITOR=vim
export MANPAGER='nvim +Man!'
export LESSHISTFILE='-'

alias rdp="xfreerdp /kbd:0x0000040C /dynamic-resolution /floatbar:sticky:on,default:visible,show:fullscreen /log-level:WARN"

# lfcd
if command -v lf > /dev/null; then
    lfcd () {
        # `command` is needed in case `lfcd` is aliased to `lf`
        command cd "$(command lf -print-last-dir "$@")"
    }
    alias lf=lfcd
    bind '"\C-o":"lfcd\C-m"'
fi

# prompt

# \[ \] is required around escape sequences. without, ctrl+r might have issues
# color reference https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124
export txtGreen='\[\033[01;32m\]'
export txtBlue='\[\033[01;34m\]'
export txtReset='\[\033[00m\]'
export txtYellow='\[\033[33m\]'

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
    export PS1="${txtGreen}\u@\h${txtReset}:${txtBlue}\w${txtYellow}\$(GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1)${txtReset}$ "
else
    export PS1="${txtGreen}\u@\h${txtReset}:${txtBlue}\w${txtReset}$ "
fi

# window title in xterms
case "$TERM" in
    xterm*|rxvt*|alacritty)
        export PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# give some info after each command

start_time=0
# this is run before every command
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT

  start_time=$(date '+%s.%3N')
}
trap "PreCommand" DEBUG

# this is run after every command, except for first prompt
FIRST_PROMPT=1
function PostCommand() {
  local code=$?
  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi

  if [ $code -ne 0 ]; then
	  echo -e "exited with code ${code}"
  fi
  end_time=$(date '+%s.%3N')
  delta=$(echo "$end_time - $start_time" | bc)
  if [ "$(echo "$delta > 0.2" | bc)" -eq 1 ]; then
	  echo "took ${delta}s"
  fi
}
PROMPT_COMMAND="PostCommand"

# fzf for better history
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# prevent ansible messages from being displayed by cows when cowsay is installed
export ANSIBLE_NOCOWS=1
