# colors
autoload -U colors && colors
PS1="%n : %1d $ "

# completion config
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# hidden files in completion
_comp_options+=(globdots)

# aliases
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
