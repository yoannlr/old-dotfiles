export SCRIPTS="$HOME/.scripts"
export PATH="$PATH:$SCRIPTS"
export SCREENLAYOUTS="$HOME/.screenlayout"

# dark theme in Qt applications
export QT_QPA_PLATFORMTHEME=qt5ct

export TERMINAL='xfce4-terminal --hide-scrollbar'
export BROWSER='brave'
export FILE='thunar'
export SYSINFO='gnome-system-monitor'

$SCREENLAYOUTS/default

# enable touchpad tapping (specific to my laptop)
xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1

setxkbmap fr
xset dpms 0 0 300
exec xss-lock --transfer-sleep-lock -- $SCRIPTS/lock.sh &
pgrep redshift || exec redshift -l 48:2 -t 6500:3000 &
xrdb -merge $HOME/.cache/wal/colors.Xresources
exec xwallpaper --no-randr --zoom $HOME/pics/walls/wall &
exec numlockx &
exec sxhkd -m 1 &
exec dunst &
exec xcompmgr &

# if kdeconnect is installed, start it and add an applet
# which kdeconnect-indicator &> /dev/null && (export $(dbus-launch); exec kdeconnect-indicator &)

# if computer has wifi, start nm-applet
ls /sys/class/net/w* &> /dev/null && which nm-applet &> /dev/null && exec nm-applet &

# if computer has bluetooth, start blueman-applet
ls /sys/class/bluetooth &> /dev/null && which blueman-applet &> /dev/null && exec blueman-applet &

exec i3
