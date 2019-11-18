export SCRIPTS="$HOME/.scripts"
export PATH="$PATH:$SCRIPTS"

export TERMINAL='xfce4-terminal'
export BROWSER='firefox'
export FILE='thunar'

$HOME/.screenlayout/dual.sh

setxkbmap fr
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
exec nitrogen --restore &
exec numlockx &
exec sxhkd -m 1 &
exec dunst &
exec i3
