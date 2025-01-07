#!/bin/bash
source "$(dirname "$0")/config.sh"

# Trap errors and handle them
trap 'echo "Error occurred. Exiting." && exit 1' ERR

# Execute subscripts
section_title "Creating User"
# bash "$(dirname "$0")/create_user.sh"
section_title "Install Packages"z
# bash "$(dirname "$0")/install_packages.sh"
section_title "Configuring System"
# bash "$(dirname "$0")/config_lightdm.sh"
# bash "$(dirname "$0")/config_firewall.sh"

# Setup slideshow and health check
section_title "CRON and Startup"
bash "$(dirname "$0")/setup_slideshow.sh"
bash "$(dirname "$0")/health_check.sh"

# Reboot to apply changes
echo "Setup complete! Rebooting..."
console_message "$GREEN" "Setup complete! Rebooting..."
# sudo reboot
