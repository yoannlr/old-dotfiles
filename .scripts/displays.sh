#!/bin/sh

layout=$(ls $SCREENLAYOUTS | dmenu -p 'select configuration')
[ ! -z $layout ] && exec "${SCREENLAYOUTS}/${layout}" && xwallpaper --no-randr --zoom $HOME/pics/walls/wall
