#!/usr/bin/fish

source ./helpers/helper.fish

versionCheck
set -l fver (echo $bver | sed -r 's/^(.*\..*)\..*$/\1/')
echo -e 😎'\e[36mUpdating Blender to \e[33mv'$bver'\e[0m'😎
wget -P ~/Downloads/ https://download.blender.org/release/Blender$fver/blender-$bver-$arch.tar.xz &> /dev/null
echo -e 🚀'\e[36mDownloaded tarball\e[0m'🚀
folderCheck
sudo tar xf ~/Downloads/blender-$bver-$arch.tar.xz -C /opt/Blender --strip-components=1
echo -e 🚀'\e[36mExtracted tarball\e[0m'🚀
rm ~/Downloads/blender-$bver-$arch.tar.xz
sudo sed -i 's{Icon=blender{Icon=/usr/share/icons/hicolor/scalable/blender.svg{' /opt/blender/blender.desktop
sudo update-icon-caches /usr/share/icons/Pop/
echo -e ♻️ '\e[36mUpdated icon caches'♻️
killall -3 gnome-shell
echo -e ♻️ 'Restarted gnome shell'♻️
echo -e ✨'\e[32mDone!\e[0m'✨
