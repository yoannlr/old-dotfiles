export SCREENLAYOUTS="$HOME/.local/screenlayout"
export TERMINAL='alacritty'
export BROWSER='brave'
export FILE='thunar'
export SYSINFO='mate-system-monitor'
export WALLPAPERS="$HOME/pics/walls/"

$SCREENLAYOUTS/default

nvidia-modprobe
xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
setxkbmap fr
xset dpms 0 0 300
exec xss-lock --transfer-sleep-lock -- slock &
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
mode='Same on each monitor' setwall "$(readlink $WALLPAPERS/wall)"
xrdb -merge $HOME/.cache/wal/colors.Xresources &

numlockx &
exec sxhkd -m 1 &
exec xcompmgr &
exec /usr/lib/xfce4/notifyd/xfce4-notifyd &
exec thunar --daemon &
exec skippy-xd --start-daemon &
exec nm-applet &
exec cbatticon &
exec xpad &
exec tint2 &

# reminders
remind | while read r
do
	notify-send "Remineder" "$r"
done

exec openbox
