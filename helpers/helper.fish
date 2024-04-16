#!/usr/bin/fish

function versionCheck -d "Validate major and minor version"
   echo 🔢 'Enter Blender version in the format x.x.x (Only v2.83+ are supported):' 🔢
   set -g bver
   while true 
      read bver
      if [ $bver = 'q' ]
         exit
      end
      if string match -qr '^2\.83|90|91|92|93\.[0-9]$|^3\.[0-6]\.[0-9]$|^4\.[0-1]\.[0-9]$' -- $bver
         if string match -qr '^2\.83\.([0-9]|1(0|2|3))$' -- $bver
            set -g arch 'linux64'
         else
            set -g arch 'linux-x64'
         end
         break
      end
      echo -e ❌ '\e[31mPlease enter a valid version or press q to exit\e[0m'❌
   end
end

function folderCheck -d "Create /opt and /opt/Blender"
   if [ ! -d '/opt' ]
      sudo mkdir /opt
   end
   if [ ! -d '/opt/Blender' ]
      sudo mkdir /opt/Blender
      echo -e 🚀'\e[36mCreated /opt/Blender\e[0m'🚀
   else
      sudo rm -rf /opt/Blender/*
      echo -e 🚀'\e[36mCleaned /opt/Blender\e[0m'🚀
   end
end
