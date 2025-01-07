#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

section_title "$TITLE_COLOR" "Create Slideshow User"

console_info "Creating slideshow linux user..."
if id "$SLIDESHOW_USER" &>/dev/null; then
    console_success "User $SLIDESHOW_USER already exists."
else
    sudo adduser --disabled-password --gecos "" $SLIDESHOW_USER || {
        console_error "Failed to create user $SLIDESHOW_USER."
        exit 1
    }
    sudo usermod -aG video,tty $SLIDESHOW_USER
fi

console_info "Setting up directories..."
sudo mkdir -p "$IMAGE_DIR"
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$BASE_DIR"
