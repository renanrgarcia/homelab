#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    echo "❌ Please don't run this script directly as root"
    echo "ℹ️ The script will use sudo when necessary"
    exit 1
fi

read -p "👤 Enter username to add to sudo group: " username
if ! id "$username" &>/dev/null; then
    echo "❌ User '$username' does not exist. Please create the user first."
    exit 1
fi

echo "👥 === Adding $username to sudo group ==="
sudo usermod -aG sudo "$username"
