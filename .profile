export LESSHISTFILE='-'
export EDITOR='vim'
export SCRIPTS="$HOME/.local/bin"
export PATH="$SCRIPTS:$PATH"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
#export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# xdg directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export GRADLE_USER_HOME="$HOME/prog/misc/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export ELINKS_CONFDIR="${XDG_CONFIG_HOME:-$HOME/.config}/elinks"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"

# ssh keyring
eval $(ssh-agent -s)
# ssh-add "$HOME/.ssh/github-rsa-g3"

# if bash, run bashrc
echo "$0" | grep "bash$" > /dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# if running on tty1, start X server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -U $(id -u) -x xinit > /dev/null && export CHOSEN_DE=$(echo -e 'openbox\ni3\ndwm' | fzy -p 'Which desktop?') && exec startx
