#!/usr/bin/fish

function versionCheck
   while true
      set -g bver 
      read bver
      if string match -qr '^2\.83|90|91|92|93\.[0-9]$|^3\.[0-6]\.[0-9]$|^4\.[0-1]\.[0-9]$' -- $bver
         if string match -qr '^2\.83\.([0-9]|1(0|2|3))$' -- $bver
            set -g arch 'linux64'
         else
            set -g arch 'linux-x64'
         end
         break
      end
      echo -e '\e[31mPlease enter a valid version\e[0m'
   end
end

function folderCheck
   if [ ! -d '/opt' ]
      sudo mkdir /opt
   end
   if [ ! -d '/opt/Blender' ]
      sudo mkdir /opt/Blender
   else
      sudo rm -rf /opt/Blender/*
   end
end
