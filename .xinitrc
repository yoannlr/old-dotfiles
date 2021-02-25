export SCREENLAYOUTS="$HOME/.screenlayout"
export TERMINAL='alacritty'
export BROWSER='brave'
export FILE='thunar'
export SYSINFO='gnome-system-monitor'
export WALLPAPERS="$HOME/pics/walls/"

$SCREENLAYOUTS/default

xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
setxkbmap fr
xset dpms 0 0 300
exec xss-lock --transfer-sleep-lock -- slock &
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
mode='Same on each monitor' setwall "$(readlink $WALLPAPERS/wall)"

numlockx &
exec sxhkd -m 1 &
exec /usr/lib/xfce4/notifyd/xfce4-notifyd &
exec nm-applet &
exec xfce4-panel &
exec xfwm4
