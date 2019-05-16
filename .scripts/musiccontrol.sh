#!/bin/bash

running=$(ps -e | grep audacious)
[ -z "$running" ] && exit 0

[ "${1}" == "t" ] && audacious -t && exit 0
[ "${1}" == "n" ] && audacious -f && exit 0
[ "${1}" == "p" ] && audacious -r && exit 0
