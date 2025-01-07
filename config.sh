#!/bin/bash

# Configuration variables
SLIDESHOW_USER="tvpitest"
SLIDESHOW_DIR="/home/$SLIDESHOW_USER/slideshow/images"
SLIDESHOW_DELAY=120
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
SLACK_CHANNEL_ERROR="#error-all"
SLACK_USERNAME="tvpi"

# Source common functions
source /home/herb/scripts/tvpi-install/lib.sh
