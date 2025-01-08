#!/bin/bash
source "$(dirname "$0")/lib.sh"

section_title "Dependencies"

console_info "Installing required packages..."
sudo apt install -y fbi || {
    console_error "Failed to install required packages."
    exit 1
}
