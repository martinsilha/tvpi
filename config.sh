#!/bin/bash

# Configuration variables
SLIDESHOW_USER=$(whoami)
BASE_DIR="/home/$SLIDESHOW_USER"
IMAGE_DIR="$BASE_DIR/Pictures"
SLIDESHOW_DIR="$BASE_DIR/slideshow"
SLIDESHOW_DELAY=120  # Delay in seconds for fbi
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
SLACK_CHANNEL_ERROR="#error-all"
SLACK_USERNAME="tvpi"

# Source common functions
source ./lib.sh
