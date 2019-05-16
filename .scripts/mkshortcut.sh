echo "File is ${1}"
read -p "Name: " name
read -p "Icon: " icon
read -p "Terminal [y/N]: " term

useTerm="false"
[ "$term" == "y" ] && useTerm="true"

fileName="$HOME/.local/share/applications/$(echo $name | sed -e 's/ /_/g').desktop"
echo ".desktop file will be ${fileName}"

echo "[Desktop Entry]" >> $fileName
echo "Type=Application" >> $fileName
echo "Name=$name" >> $fileName
[ ! -z $icon ] && echo "Icon=$icon" >> $fileName
echo "Exec=${1}" >> $fileName
echo "Terminal=$useTerm">> $fileName

chmod +x $fileName

echo "$fileName created."
