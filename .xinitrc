# enable typing when simply touching the trackpad
xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1

# numlock on startup
numlockx &

#export $(dbus-launch)

# set some variables
export SUDO_ASKPASS=$HOME/.scripts/sudoaskpass.sh
export TERMINAL=st
export BROWSER=firefox
export FILEBROWSER=spacefm
export SCRIPTSDIR=$HOME/.scripts

# compton, X compositor
exec compton &

# auto lock computer after a minute idle
exec xautolock -time 1 -locker $SCRIPTSDIR/lock.sh &

# bind keys, '-m 1' because azerty keyboard
exec sxhkd -m 1 &

# dunst, for notifications
exec dunst &

# start i3
exec i3
