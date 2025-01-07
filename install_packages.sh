#!/bin/bash
source "$(dirname "$0")/config.sh"

section_title "Dependencies"

console_info "Installing required packages..."
# sudo apt update && sudo apt install -y feh lightdm xorg || {
#     console_error "Failed to install required packages."
#     exit 1
# }
