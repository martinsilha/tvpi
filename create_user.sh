#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

section_title "$TITLE_COLOR" "Create Slideshow User"

console_message "$YELLOW" "Creating slideshow user..."
if id "$SLIDESHOW_USER" &>/dev/null; then
    console_message "$GREEN" "User $SLIDESHOW_USER already exists."
else
    sudo adduser --disabled-password --gecos "" $SLIDESHOW_USER || {
        console_message "$RED" "Failed to create user $SLIDESHOW_USER."
        exit 1
    }
    sudo usermod -aG video,tty $SLIDESHOW_USER
fi
