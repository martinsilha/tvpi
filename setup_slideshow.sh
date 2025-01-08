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
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$SLIDESHOW_DIR"

console_info "Setting up image directory..."
sudo mkdir -p "$IMAGE_DIR"
curl -o "$IMAGE_DIR/1.jpg" "https://placehold.co/600x400/EEE/31343C.jpg"
curl -o "$IMAGE_DIR/2.jpg" "https://placehold.co/600x400/EEE/31343C.jpg"
curl -o "$IMAGE_DIR/3.jpg" "https://placehold.co/600x400/EEE/31343C.jpg"

console_info "Creating slideshow script..."
create_script "$SLIDESHOW_DIR/start_slideshow.sh" "#!/bin/bash
sudo fbi -d /dev/fb0 -T 1 -a -t $SLIDESHOW_DELAY --noverbose --readahead $IMAGE_DIR/*.{jpg,jpeg,webp} 2>/dev/null"

console_info "Creating systemd service for slideshow..."
sudo bash -c "cat > /etc/systemd/system/slideshow.service <<EOF
[Unit]
Description=Slideshow Service
After=network.target

[Service]
ExecStartPre=/bin/sleep 30
ExecStart=/bin/bash $SLIDESHOW_DIR/start_slideshow.sh
Restart=always
User=$SLIDESHOW_USER
Group=$SLIDESHOW_USER


[Install]
WantedBy=multi-user.target
EOF"

console_info "Enabling and starting slideshow service..."
sudo systemctl enable slideshow.service
sudo systemctl start slideshow.service

console_success "Slideshow service created and started successfully."

# console_info "Setting up cron job to restart slideshow script..."
# (crontab -l 2>/dev/null; echo "@reboot $SLIDESHOW_DIR/start_slideshow.sh") | crontab -
# console_success "Slideshow script and cron job set up successfully."
