#!/bin/bash

echo "Configuring firewall..."
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
yes | sudo ufw enable || echo "Firewall configuration skipped."
