#!/bin/sh

# install all the programs and deploys the dotfiles on a new arch install

sudo pacman -S $(cut -d, -f1 'programs.csv' | grep -E -v '(^#|^aur:)' | tr '\n' ' ')
./deploy.sh
