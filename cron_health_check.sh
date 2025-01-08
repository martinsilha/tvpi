#!/bin/bash
source "$(dirname "$0")/config.sh"

section_title "Setup Health Check"
console_info "Creating health check script..."
sudo bash -c "cat <<EOF > $SLIDESHOW_DIR/health_check.sh
#!/bin/bash
echo \"Health check: System is running.\"
EOF"
console_info "Setting permissions and adding to crontab..."
sudo chmod +x $SLIDESHOW_DIR/health_check.sh

# Check if the cron job already exists
if ! sudo crontab -u $SLIDESHOW_USER -l 2>/dev/null | grep -q "$SLIDESHOW_DIR/health_check.sh"; then
    (sudo crontab -u $SLIDESHOW_USER -l 2>/dev/null; echo "0 * * * * $SLIDESHOW_DIR/health_check.sh") | sudo crontab -u $SLIDESHOW_USER -
    console_success "Health check cron job added."
else
    console_info "Health check cron job already exists."
fi
