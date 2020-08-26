#!/bin/sh

# installs all the programs and deploys the dotfiles on a new arch install

INSTALL_AUR=
MAKE_HOME=

while getopts 'am' c
do
	case $c in
		'a') INSTALL_AUR=1 ;;
		'm') MAKE_HOME=1 ;;
		*)
			echo "$0 options\n-a  installs AUR packages\n-m  creates folders in home directory"
	esac
done

echo ":: Installing packages"
sudo pacman -S $(cut -d, -f1 'programs.csv' | grep -E -v '(^#|^aur:)' | tr '\n' ' ')
echo ":: Packages installed"

if [ ! -z $INSTALL_AUR ]
then
	echo ":: Installing AUR packages"
	basedir="$PWD"
	for pkg in $(cut -d, -f1 'programs.csv' | grep '^aur:' | cut -d: -f2)
	do
		git clone "https://aur.archlinux.org/${pkg}.git"
		cd "$pkg"
		makepkg -sri --noconfirm
	done
	echo ":: AUR packages installed"
fi

./deploy.sh

# create home structure

if [ ! -z $MAKE_HOME ]
then
	mkdir -p "$HOME/pics/walls" "$HOME/prog/repo"
	mkdir "$HOME/dl" "$HOME/bin" "$HOME/phone" "$HOME/mnt" "$HOME/docs" "$HOME/vids" "$HOME/soft" "$HOME/music"
	ln -s "$HOME/prog/repo" "$HOME/repo"
	touch "$HOME/${USER}.todo"
	echo ":: Home structure created"
fi
