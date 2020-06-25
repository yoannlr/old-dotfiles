#!/bin/sh

# installs all the programs and deploys the dotfiles on a new arch install

sudo pacman -S $(cut -d, -f1 'programs.csv' | grep -E -v '(^#|^aur:)' | tr '\n' ' ')
echo ":: Packages installed" 

./deploy.sh

for pkg in $(cut -d, -f1 'programs.csv' | grep '^aur:')
do
	git clone "https://aur.archlinux.org/${pkg}.git"
done
echo ":: AUR packages cloned"

# create home structure (specific to my setup, will only execute if $1 is "home")

if [ "$1" = "home" ]
then
	mkdir -p "$HOME/pics/walls"
	mkdir "$HOME/dl" "$HOME/bin" "$HOME/phone" "$HOME/mnt"
	ln -s /mnt/data "$HOME/disk"
	ln -s /mnt/data/Documents "$HOME/docs"
	ln -s /mnt/data/Music "$HOME/music"
	ln -s /mnt/data/Programming "$HOME/prog"
	ln -s /mnt/data/Videos "$HOME/vids"
	ln -s /mnt/data/Programming/Repo "$HOME/repo"
	ln -s /mnt/data/VirtualMachines "$HOME/vm"
	ln -s /mnt/data/Software "$HOME/soft"
	# such symlinks wow
	echo ":: Home structure created"
fi
