rsync --dry-run --ignore-existing -v ~/music/* ~/phone/SD/Music/
read -p "Press enter to continue, ^C to cancel."
rsync --ignore-existing -v ~/music/* ~/phone/SD/Music/
