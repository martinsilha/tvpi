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
chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$SLIDESHOW_DIR"

console_info "Creating slideshow script..."
create_script "$SLIDESHOW_DIR/start_slideshow.sh" "#!/bin/bash
sudo fbi -d /dev/fb0 -T 1 -a -t $SLIDESHOW_DELAY --noverbose --readahead $IMAGE_DIR/*.{jpg,jpeg,webp} 2>/dev/null"

console_info "Setting up cron job to restart slideshow script..."
(crontab -l 2>/dev/null; echo "@reboot $SLIDESHOW_DIR/start_slideshow.sh") | crontab -
console_success "Slideshow script and cron job set up successfully."
