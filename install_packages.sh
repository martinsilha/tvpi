#!/bin/bash
section_title "$TITLE_COLOR" "Installing Required Packages"

console_message "$GREEN" "Installing required packages..."
sudo apt update && sudo apt install -y feh lightdm xorg || {
    echo "Failed to install required packages."
    console_message "$RED" "Failed to install required packages."
    exit 1
}
