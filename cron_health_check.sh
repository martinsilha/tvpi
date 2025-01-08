#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

section_title "Setup Health Check"
console_info "Creating health check script..."
create_script "$SLIDESHOW_DIR/health_check.sh" "#!/bin/bash
echo \"Health check: System is running.\""

console_info "Setting permissions and adding to crontab..."
chmod +x $SLIDESHOW_DIR/health_check.sh

# Check if the cron job already exists
if ! crontab -l 2>/dev/null | grep -q "$SLIDESHOW_DIR/health_check.sh"; then
    (crontab -l 2>/dev/null; echo "0 * * * * $SLIDESHOW_DIR/health_check.sh") | crontab -
    console_success "Health check cron job added."
else
    console_info "Health check cron job already exists."
fi
