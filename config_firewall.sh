#!/bin/bash
source "$(dirname "$0")/lib.sh"

section_title "Firewall"
console_info "Installing firewall"
sudo apt install -y ufw
# console_info "Denying incoming traffic"
# sudo ufw default deny incoming
console_info "Allowing outgoing traffic"
sudo ufw default allow outgoing
console_info "Allowing SSH"
sudo ufw allow ssh
# console_info "Enabling firewall"
# yes | sudo ufw enable || console_warning "Firewall configuration skipped."
console_success "Firewall installed and configured"
