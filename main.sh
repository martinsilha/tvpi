#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

# Trap errors and handle them
trap 'echo "Error occurred. Exiting." && exit 1' ERR

# Create directories
section_title "Creating Directories"
sudo touch $SLIDESHOW_DIR/health_check.sh
sudo chmod +x $SLIDESHOW_DIR/health_check.sh

# Execute subscripts
bash "$(dirname "$0")/install_packages.sh"
# bash "$(dirname "$0")/config_firewall.sh"

# Setup slideshow and health check
section_title "CRON and Startup"
console_info "Setup Slideshow"
bash "$(dirname "$0")/setup_slideshow.sh"
console_info "Setup Health Check"
bash "$(dirname "$0")/cron_health_check.sh"

# Reboot to apply changes
console_success "Setup complete! Rebooting..."
# sudo reboot
