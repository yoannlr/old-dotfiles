xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
numlockx &
xrandr --output eDP-1 --brightness 0.5
export $(dbus-launch)
export SUDO_ASKPASS=$HOME/.scripts/sudoaskpass.sh
export TERMINAL=st
export BROWSER=firefox
export FILEBROWSER=spacefm
export SCRIPTSDIR=$HOME/.scripts
exec compton &
exec xautolock -time 1 -locker $SCRIPTSDIR/lock.sh &
exec i3
