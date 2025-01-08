#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

# Determine the active console
ACTIVE_CONSOLE=$(fgconsole || tty)

# Verify if the script is being run on a Linux console
if ! tty | grep -q '/dev/tty'; then
    echo "This script must be run on a Linux console."
    exit 1
fi

# Verify if the console number is valid
if [[ -e /dev/pts/0 ]]; then
    echo "Console is available."
else
    echo "Couldn't get a file descriptor referring to the console."
fi

console_info "Setting up slideshow directory..."
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$SLIDESHOW_DIR"

console_info "Creating slideshow script..."
sudo bash -c "cat <<EOF > $SLIDESHOW_DIR/start_slideshow.sh
#!/bin/bash
while true; do
    sudo fbi -d /dev/fb0 -T \$(fgconsole) -a -t $SLIDESHOW_DELAY --noverbose --readahead $IMAGE_DIR/*.{jpg,webp} 2>/dev/null
done
EOF"
sudo chmod +x $SLIDESHOW_DIR/start_slideshow.sh
