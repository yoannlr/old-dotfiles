#!/bin/bash

[ ! -z "$(pgrep i3lock)" ] && exit
res=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
ffmpeg -f x11grab -video_size $res -y -i $DISPLAY -i $HOME/.scripts/lockicon.png -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 /tmp/lock.png -loglevel quiet
i3lock -i /tmp/lock.png
rm /tmp/lock.png
