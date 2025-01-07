#!/bin/bash
source "$(dirname "$0")/config.sh"

echo "Setting up slideshow directory..."
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "/home/$SLIDESHOW_USER/slideshow"

echo "Configuring .xinitrc for $SLIDESHOW_USER..."
sudo -u $SLIDESHOW_USER bash -c "cat <<EOF > /home/$SLIDESHOW_USER/.xinitrc
feh --fullscreen --preload --hide-pointer --slideshow-delay $SLIDESHOW_DELAY $SLIDESHOW_DIR
EOF"
