export SCRIPTS="$HOME/.scripts"
export PATH="$PATH:$SCRIPTS"
export SCREENLAYOUTS="$HOME/.screenlayout"

export TERMINAL='xfce4-terminal --hide-scrollbar'
export BROWSER='brave'
export FILE='thunar'

$SCREENLAYOUTS/dual.sh

setxkbmap fr
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
xrdb -merge $HOME/.cache/wal/colors.Xresources
exec xwallpaper --no-randr --zoom $HOME/pics/walls/wall &
exec numlockx &
exec sxhkd -m 1 &
exec dunst &
exec xcompmgr &

# if you have a laptop, uncomment next line to get a low-battery notification
#exec $SCRIPTS/battery.sh BAT0 20 10

exec i3
