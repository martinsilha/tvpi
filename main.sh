#!/bin/bash
source "$(dirname "$0")/config.sh"

# Trap errors and handle them
trap 'echo "Error occurred. Exiting." && exit 1' ERR

# Execute subscripts
# bash "$(dirname "$0")/create_user.sh"
# bash "$(dirname "$0")/install_packages.sh"
# bash "$(dirname "$0")/config_lightdm.sh"
# bash "$(dirname "$0")/config_firewall.sh"
bash "$(dirname "$0")/setup_slideshow.sh"
bash "$(dirname "$0")/health_check.sh"

# Reboot to apply changes
echo "Setup complete! Rebooting..."
sudo reboot
