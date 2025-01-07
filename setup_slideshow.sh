#!/bin/bash
# Ensure the following commands can be run without a password by configuring sudoers:
# sudo visudo
# Add the following lines:
# %sudo ALL=(ALL) NOPASSWD: /bin/mkdir, /bin/chown

source "$(dirname "$0")/config.sh"

console_message "$BLUE" "Setting up slideshow directory..."
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "/home/$SLIDESHOW_USER/slideshow"

console_message "$BLUE" "Configuring .xinitrc for $SLIDESHOW_USER..."
sudo -u $SLIDESHOW_USER bash -c "cat <<EOF > /home/$SLIDESHOW_USER/.xinitrc
feh --fullscreen --preload --hide-pointer --slideshow-delay $SLIDESHOW_DELAY $SLIDESHOW_DIR
EOF"
