#!/bin/bash

# Wazuh Agent Automated Installer (Ubuntu)
# Run with: sudo ./install_wazuh_agent.sh

# Configuration
# replace manager_ip with your wazuh's manager public IP address. Don't remove the ""
# replace wazuh-agent-url with your wazuh's url. Don't remove the ""
WAZUH_MANAGER_IP="manager_ip"
DOWNLOAD_URL="wazuh-agent-url"
LOCAL_CONFIG="/var/ossec/etc/local_internal_options.conf"

# Exit on error
set -e

echo "[1/4] Downloading and installing Wazuh agent..."
wget -q "$DOWNLOAD_URL" -O /tmp/wazuh-agent.deb
sudo WAZUH_MANAGER="$WAZUH_MANAGER_IP" dpkg -i /tmp/wazuh-agent.deb
rm -f /tmp/wazuh-agent.deb

echo "[2/4] Configuring remote commands..."
sudo tee -a "$LOCAL_CONFIG" > /dev/null <<EOF
wazuh_command.remote_commands=1
logcollector.remote_commands=1
EOF

echo "[3/4] Starting service..."
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

echo "[4/4] Verification:"
sudo systemctl status wazuh-agent --no-pager
echo "Done! Agent is now active and managed by $WAZUH_MANAGER_IP."
