#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

# Determine the active console
ACTIVE_CONSOLE=$(fgconsole)

# Verify if the console number is valid
if [[ -z "$ACTIVE_CONSOLE" || "$ACTIVE_CONSOLE" -lt 1 ]]; then
    echo "Error: Unable to determine the active console."
    exit 1
fi

console_info "Setting up slideshow directory..."
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$SLIDESHOW_DIR"

console_info "Creating slideshow script..."
sudo bash -c "cat <<EOF > $SLIDESHOW_DIR/start_slideshow.sh
#!/bin/bash
while true; do
    sudo fbi -d /dev/fb0 -T $(fgconsole) -a -t $SLIDESHOW_DELAY --noverbose $IMAGE_DIR/*.{bmp,jpg,png,webp} 2>/dev/null
done
EOF"
sudo chmod +x $SLIDESHOW_DIR/start_slideshow.sh
