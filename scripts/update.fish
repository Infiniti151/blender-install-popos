#!/usr/bin/fish

source ./helpers/helper.fish

if [ -z "$(command -v blender)" ]
    echo "Blender is not installed. Please use the install option. Exiting."
    return
end
echo 🔢 'Press Enter to update to the latest version or enter version in the format x.x.x (Only v2.83+ are supported):' 🔢
versionCheck
getDownloadURL
if [ (blender --version | awk 'NR==1 {print $2}') = $bver ]
    echo "Latest version of Blender (v$bver) is already installed. Exiting."
    return
end
echo -e 😎'\e[36mUpdating Blender to \e[33mv'$bver'\e[0m'😎
wget -P ~/Downloads/ $download_url &> /dev/null
echo -e 🚀'\e[36mDownloaded tarball\e[0m'🚀
folderCheck
sudo tar xf ~/Downloads/blender-$bver-$arch.tar.xz -C /opt/Blender --strip-components=1
echo -e 🚀'\e[36mExtracted tarball\e[0m'🚀
rm ~/Downloads/blender-$bver-$arch.tar.xz
sudo sed -i 's{Icon=blender{Icon=/usr/share/icons/hicolor/scalable/blender.svg{' /opt/blender/blender.desktop
sudo update-icon-caches /usr/share/icons/Pop/
echo -e ♻️ '\e[36mUpdated icon caches'♻️
echo -e ✨'\e[32mDone!\e[0m'✨
