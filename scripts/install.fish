#!/usr/bin/fish

source ./helpers/helper.fish

if [ ! -z "$(command -v blender)" ]
    echo "Blender is already installed. Please use the update option. Exiting."
    return
end
echo 🔢 'Press Enter to install the latest version or enter version in the format x.x.x (Only v2.83+ are supported):' 🔢
versionCheck
getDownloadURL
echo -e 😎'\e[36mInstalling Blender \e[33mv'$bver'\e[0m'😎
wget -P ~/Downloads/ $download_url &> /dev/null
echo -e 🚀'\e[36mDownloaded tarball\e[0m'🚀
folderCheck
sudo tar xf ~/Downloads/blender-$bver-$arch.tar.xz -C /opt/Blender --strip-components=1
echo -e 🚀'\e[36mExtracted tarball\e[0m'🚀
rm ~/Downloads/blender-$bver-$arch.tar.xz
cd /opt
sudo ln -sf Blender blender
sudo ln -sf /opt/blender/blender /usr/bin/blender
sudo ln -sf /opt/blender/blender-thumbnailer /usr/bin/blender-thumbnailer
sudo ln -sf /opt/blender/blender.desktop /usr/share/applications/
sudo ln -sf /opt/blender/blender.svg /usr/share/icons/hicolor/scalable/
echo -e 🚀'\e[36mCreated symlinks\e[0m'🚀
sudo sed -i 's{Icon=blender{Icon=/usr/share/icons/hicolor/scalable/blender.svg{' /opt/blender/blender.desktop
echo 'application/x-blender				blend' | sudo tee -a /etc/mime.types >/dev/null
echo -e '[Thumbnailer Entry]\nTryExec=/usr/bin/blender-thumbnailer\nExec=/usr/bin/blender-thumbnailer %i %o\nMimeType=application/x-blender;\n' | sudo tee -a /usr/share/thumbnailers/x-blender.thumbnailer > /dev/null
sudo ln -sf /opt/blender/blender-symbolic.svg /usr/share/icons/Pop/scalable/mimetypes/application-x-blender.svg
echo -e 🚀'\e[36mCreated MIME type\e[0m'🚀
echo 'application/x-blender=blender.desktop;' | sudo tee -a ~/.config/mimeapps.list >/dev/null
echo -e 🚀'\e[36mSet as the default app\e[0m'🚀
sudo update-icon-caches /usr/share/icons/Pop/
echo -e ♻️ '\e[36mUpdated icon caches'♻️
echo -e ✨'\e[32mDone!\e[0m'✨
