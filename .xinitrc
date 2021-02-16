export SCREENLAYOUTS="$HOME/.screenlayout"
export TERMINAL='alacritty'
export BROWSER='brave'
export FILE='thunar'
export SYSINFO='gnome-system-monitor'
export WALLPAPERS="$HOME/pics/walls/"

$SCREENLAYOUTS/default

setxkbmap fr
xset dpms 0 0 300
exec xss-lock --transfer-sleep-lock -- slock &
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
mode='Same on each monitor' setwall "$(readlink $WALLPAPERS/wall)"

numlockx &
exec sxhkd -m 1 &
exec dunst &
exec nm-applet &
exec xfce4-panel &
exec xfwm4
