#!/bin/bash
source "$(dirname "$0")/config.sh"

echo "Configuring health check..."
sudo bash -c "cat <<EOF > /home/$SLIDESHOW_USER/health_check.sh
#!/bin/bash
curl -X POST -H 'Content-type: application/json' --data \"{
    \\\"channel\\\": \\\"$SLACK_CHANNEL_ERROR\\\",
    \\\"username\\\": \\\"$SLACK_USERNAME\\\",
    \\\"text\\\": \\\"Health check: System is running.\\\"
}\" $SLACK_WEBHOOK_URL
EOF"
sudo chmod +x /home/$SLIDESHOW_USER/health_check.sh
(sudo crontab -u $SLIDESHOW_USER -l 2>/dev/null; echo "0 * * * * /home/$SLIDESHOW_USER/health_check.sh") | sudo crontab -u $SLIDESHOW_USER -
