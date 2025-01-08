#!/bin/bash

# Configuration variables
SLIDESHOW_USER=$(whoami)
BASE_DIR="/home/$SLIDESHOW_USER"
IMAGE_DIR="$BASE_DIR/Pictures"
SLIDESHOW_DIR="$BASE_DIR/slideshow"
SLIDESHOW_DELAY=120  # Delay in seconds for fbi

# Source common functions
source "$(dirname "$0")/lib.sh"
