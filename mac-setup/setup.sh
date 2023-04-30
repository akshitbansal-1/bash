#!/bin/bash

check_sudo_permissions() {
    if sudo -n true 2>/dev/null; then
        echo "Running scripts"
    else
        echo "Sudo permissions are required"
        exit 0
    fi
}

# check_sudo_permissions

source install-brew-and-tools.sh
source docker-k8s.sh
source dev-tools.sh


echo "\n\n\n\nYou can install other commands/apps through their website as well"
echo "1. Install slack from app store"
echo "2. Install chrome from: https://www.google.com/chrome"
echo "3. Install discord from: https://discord.com/download"
echo "4. Install gdrive from: https://www.google.com/intl/en_in/drive/download/"
echo "5. Install github desktop from: https://desktop.github.com/"
echo "6. Install gramarly from: https://www.grammarly.com/desktop"
echo "7. Install notion from: https://www.notion.so/desktop"
echo "8. Install openlens from: https://github.com/MuhammedKalkan/OpenLens/releases/tag/v6.2.5"
echo "9. Install sublime from: https://www.sublimetext.com/download"
echo "10. Install wireshark from: https://www.wireshark.org/ -> Get started"



