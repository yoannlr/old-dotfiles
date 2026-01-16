# My GNU/Linux Dotfiles

This repository contains my dotfiles (i.e. configuration files).
I use these dotfiles on Debian (installation with standard ISO, no desktop environment).
My goal is to get things done: no fancy stuff here, just a lightweight yet functional setup.

Each directory here is a `stow` package.
The wrapper `apply` on the root folder *stows* the configuration into the user's home directory and runs the `setup` script if present (which purpose is usually to installed the required packages on the system).
It is a simple alternative to using a more complex system such as chezmoi or Ansible.

## stow packages overview

* i3 - sets up a lightweight desktop environment based on i3 wm, i3blocks, dunst and MATE utilities
* shell - sets up bash and vim
* newsboat - sets up a lightweight terminal RSS reader
* mpd - sets up mpd (music player daemon) and ncmpcpp (terminal ui for mpd)
* sysadmin - installs common system/network administration utilities
* libvirt - sets up virtualization environment based on qemu/kvm + installs utils
* minecraft - sets up java, PrismLauncher, Blockbench and unbted
* intellij - sets up java and IntelliJ IDEA Community Edition
* codium - installs VSCodium
* mutt - installs mutt-wizard and useful mail related programs
* video - sets up kdenlive, gimp and other useful video making programs
* bin - sets up personal scripts
