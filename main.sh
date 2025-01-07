#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

# Trap errors and handle them
trap 'echo "Error occurred. Exiting." && exit 1' ERR

# Execute subscripts
bash "$(dirname "$0")/create_user.sh"
bash "$(dirname "$0")/install_packages.sh"
bash "$(dirname "$0")/config_lightdm.sh"
bash "$(dirname "$0")/config_firewall.sh"

# Setup slideshow and health check
section_title "$TITLE_COLOR" "CRON and Startup"
console_message "$BRIGHT_YELLOW" "Setup Slideshow"
bash "$(dirname "$0")/setup_slideshow.sh"
console_message "$BRIGHT_YELLOW" "Setup Health Check"
bash "$(dirname "$0")/health_check.sh"

# Reboot to apply changes
console_message "$GREEN" "Setup complete! Rebooting..."
# sudo reboot
