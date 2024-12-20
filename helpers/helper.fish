#!/usr/bin/fish

function versionCheck -d "Validate major and minor version"
   echo 🔢 'Press Enter to update to the latest version or enter version in the format x.x.x (Only v2.83+ are supported):' 🔢
   set -g bver
   while true 
      read bver
      if [ -z $bver ]
         break
      end
      if [ $bver = 'q' ]
         exit
      end
      if string match -qr '^2\.83|90|91|92|93\.[0-9]$|^3\.[0-6]\.[0-9]$|^4\.[0-3]\.[0-9]$' -- $bver
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

function getDownloadURL -d "Generate download URL"
   set -l url 'https://download.blender.org/release/'
   if test -z "$bver"
      set -g arch 'linux-x64'       
      set -l fver (wget -O - $url 2>&1 | \
         awk 'BEGIN{RS="</a>";FS="<*>"}/Blender[1-9]/{a=$NF}END{print a}')
      set -l slug (wget -O - $url$fver 2>&1 | \
         awk 'BEGIN{RS="</a>";FS="<*>"};/linux/{a=$NF}END{print a}')
      set -g bver (echo $slug | awk '{print substr($0, 9, 5)}')
      set -g download_url $url$fver$slug
   else
      set -l fver (echo $bver | sed -r 's/^(.*\..*)\..*$/\1/')
      set -g download_url (string join '' $url 'Blender' $fver '/blender-' $bver '-' $arch '.tar.xz')
   end
   echo $bver > ../blender.log
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
