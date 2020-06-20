#!/bin/sh

echo ":: Simulating deploying dotfiles to $HOME"
rsync --dry-run -v -r -lp --exclude={'README.md','sync.sh','deploy.sh','.git','programs.csv','screenshot.png'} "$PWD/" $HOME
read -p ":: Is that correct? [Y/n]" cont
[ "$cont" = "n" ] && echo ":: Abort." && exit
rsync -v -r -lp --exclude={'README.md','sync.sh','deploy.sh','.git','programs.csv','screenshot.png'} "$PWD/" $HOME
echo ":: Done deploying dotfiles"

