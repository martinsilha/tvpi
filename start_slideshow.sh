#!/bin/bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

LOG_FILE="/var/log/slideshow.log"

echo "Starting slideshow at $(date)" >> $LOG_FILE

/usr/bin/fbi -d /dev/fb0 -T 1 -a -t $SLIDESHOW_DELAY --noverbose --readahead $IMAGE_DIR/*.{jpg,jpeg,webp} 2>> $LOG_FILE

if [ $? -ne 0 ]; then
    echo "Error starting slideshow at $(date)" >> $LOG_FILE
    exit 1
fi

echo "Slideshow started successfully at $(date)" >> $LOG_FILE
