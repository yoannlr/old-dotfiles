export LESSHISTFILE='/dev/null'
export EDITOR='vim'
export PATH="$PATH:$HOME/bin"

echo "$0" | grep "bash$" > /dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
