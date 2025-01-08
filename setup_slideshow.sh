#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

# Verify if the console number is valid
if [[ -e /dev/pts/0 ]]; then
    echo "Console is available."
else
    echo "Couldn't get a file descriptor referring to the console."
fi

console_info "Setting up slideshow directory..."
mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $USER:$USER "$SLIDESHOW_DIR"

console_info "Creating slideshow script..."
bash -c "cat <<EOF > $SLIDESHOW_DIR/start_slideshow.sh
#!/bin/bash
while true; do
    sudo fbi -d /dev/fb0 -T 1 -a -t $SLIDESHOW_DELAY --noverbose --readahead $IMAGE_DIR/*.{jpg,jpeg,webp} 2>/dev/null
done
EOF"
chmod +x $SLIDESHOW_DIR/start_slideshow.sh
