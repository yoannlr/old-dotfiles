export SCRIPTS="$HOME/.scripts"
export PATH="$PATH:$SCRIPTS"
export SCREENLAYOUTS="$HOME/.screenlayout"

export TERMINAL='xfce4-terminal'
export BROWSER='brave'
export FILE='thunar'

$SCREENLAYOUTS/dual.sh

setxkbmap fr
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
exec nitrogen --restore &
exec numlockx &
exec sxhkd -m 1 &
exec dunst &
exec xcompmgr &

# if you have a laptop, uncomment next line to get a low-battery notification
#exec $SCRIPTS/battery.sh

exec i3
