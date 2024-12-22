#!/usr/bin/fish

if [ -z "$(command -v blender)" ]
    echo "Blender is not installed. Exiting."
    return
end
echo -e ⚠️ 'Are you sure (y/n)?'⚠️
read op
switch $op
    case 'y' 'Y'
        true > '../blender.log'
        sudo unlink /usr/bin/blender
        sudo unlink /usr/bin/blender-thumbnailer
        echo -e 🗑️ '\e[31mDeleted binaries'🗑️
        sudo unlink /usr/share/applications/blender.desktop
        echo -e 🗑️ 'Deleted desktop file'🗑️
        sudo unlink /usr/share/icons/hicolor/scalable/blender.svg 
        echo -e 🗑️ 'Deleted icon'🗑️
        sudo sed -i '/blender/d'  /etc/mime.types
        sudo unlink /usr/share/thumbnailers/x-blender.thumbnailer
        sudo unlink /usr/share/icons/Pop/scalable/mimetypes/application-x-blender.svg
        echo -e 🗑️ 'Deleted MIME type'🗑️
        sudo sed -i '/blender/d'  ~/.config/mimeapps.list
        echo -e 🗑️ 'Removed from default apps'🗑️
        sudo rm -rf /opt/Blender /opt/blender
        echo -e 🗑️ 'Deleted directory'🗑️
        sudo update-icon-caches /usr/share/icons/Pop/
        echo -e ♻️ '\e[36mUpdated icon caches'♻️
        echo -e ✔️ '\e[32mSuccessfully uninstalled Blender!\e[0m'✔️
    case '*'
        exit
end
