echo "Copying .desktop"
    cp ./main.desktop /usr/share/applications/tu-player.desktop
    # reload desktop database to load app in list of available
    update-desktop-database /usr/share/applications
    # update icons
    update-icon-caches /usr/share/icons/*