# README

This repo allows installing/updating Blender in PopOS. It uses the fish shell for both of those actions. It was created as the latest versions of Blender take a long time to appear in the official repo.
This repo includes two fish scripts:
1. blenderi : For installing Blender
2. blenderu : For updating Blender

## Steps in blenderi
1. Download the tarball of the specified version of Blender
2. Extract tarball to /opt/Blender
3. Delete tarball
4. Create symlinks for blender and blender-thumbnailer binaries
5. Update icon caches with with Blender icons
6. Restart Gnome shell to make Blender appear in the launcher (Works with X11. If you're using Wayland, you'll need to re-login)

## Steps in blenderu
1. Download the tarball of the specified version of Blender
2. Extract tarball to /opt/Blender
3. Delete tarball
4. Update icon caches with with Blender icons
5. Restart Gnome shell to make Blender appear in the launcher (Works with X11. If you're using Wayland, you'll need to re-login)

## Dependencies
1. fish shell

## Installing Blender v.x.x.x with blenderi
```fish blenderi x.x.x```

Example: Install Blender v4.1.0
```fish blenderi 4.1.0```

## Updating Blender to v.x.x.x with blenderu
```fish blenderu x.x.x```

Example: Updating to Blender v4.1.1
```fish blenderi 4.1.1```

👏👏👏 Thanks to spitzak on [devtalk.blender.org](https://devtalk.blender.org/t/how-to-install-in-linux-including-desktop-icons/33513/6) for giving detailed steps.
