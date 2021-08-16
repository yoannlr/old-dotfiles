export LESSHISTFILE='-'
export EDITOR='vim'
export SCRIPTS="$HOME/.local/bin"
export PATH="$SCRIPTS:$PATH"

# xdg directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$HOME/prog/misc/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"

# ssh keyring
eval $(ssh-agent -s)
# ssh-add "$HOME/.ssh/github-rsa-g3"

# if bash, run bashrc
echo "$0" | grep "bash$" > /dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# if running on tty1, start X server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -U $(id -u) -x xinit > /dev/null && exec startx
