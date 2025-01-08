#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

section_title "$TITLE_COLOR" "Setup Directories"

console_info "Setting up directories..."
sudo mkdir -p "$IMAGE_DIR"
sudo mkdir -p "$SLIDESHOW_DIR"
sudo chown -R $SLIDESHOW_USER:$SLIDESHOW_USER "$BASE_DIR"
console_success "Directories set up successfully."
