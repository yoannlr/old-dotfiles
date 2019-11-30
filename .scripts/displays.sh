#!/bin/sh

layout=$(ls $SCREENLAYOUTS | dmenu -p 'select configuration')
[ ! -z $layout ] && exec "${SCREENLAYOUTS}/${layout}"
