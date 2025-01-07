#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

console_info "Setting up slideshow directory..."
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "/home/$SLIDESHOW_USER/slideshow"

console_info "Creating slideshow script..."
sudo bash -c "cat <<EOF > /home/$SLIDESHOW_USER/start_slideshow.sh
#!/bin/bash
while true; do
    sudo fbi -T 1 -a -t $SLIDESHOW_DELAY -noverbose -random $SLIDESHOW_DIR/*
done
EOF"
sudo chmod +x /home/$SLIDESHOW_USER/start_slideshow.sh
