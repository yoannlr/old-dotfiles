export LESSHISTFILE='-'
export EDITOR='vim'
export PATH="$PATH:$HOME/bin"

# xdg directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$HOME/prog/misc/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# if bash, run bashrc
echo "$0" | grep "bash$" > /dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# if running on tty1, start i3
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
