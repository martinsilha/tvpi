#!/bin/bash
source "$(dirname "$0")/config.sh"

echo "Configuring LightDM for auto-login..."
if [ -f /etc/lightdm/lightdm.conf ]; then
    sudo sed -i '/^autologin-user=/d' /etc/lightdm/lightdm.conf
    sudo sed -i '/^autologin-user-timeout=/d' /etc/lightdm/lightdm.conf
    sudo bash -c "cat <<EOF >> /etc/lightdm/lightdm.conf
[Seat:*]
autologin-user=$SLIDESHOW_USER
autologin-user-timeout=0
EOF"
else
    echo "LightDM configuration file not found!"
    exit 1
fi

sudo systemctl enable lightdm
sudo systemctl start lightdm
