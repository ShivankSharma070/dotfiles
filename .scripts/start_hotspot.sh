#!/bin/bash
# save as ~/start-hotspot.sh

CONFIG_FILE="/etc/create_ap.conf"

# Get current WiFi channel
CURRENT_CHANNEL=$(nmcli -f IN-USE,CHAN device wifi | grep '\*' | awk '{print $2}')

if [ -z "$CURRENT_CHANNEL" ]; then
    echo "Error: Could not detect WiFi channel. Are you connected to WiFi?"
    exit 1
fi

echo "Detected WiFi on channel: $CURRENT_CHANNEL"

# Update the channel in config
sudo sed -i "s/^CHANNEL=.*/CHANNEL=$CURRENT_CHANNEL/" "$CONFIG_FILE"

echo "Updated config with channel $CURRENT_CHANNEL"

# Restart the service
sudo systemctl restart create_ap

echo "Hotspot restarted with correct channel"
