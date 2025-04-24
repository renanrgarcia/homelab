#!/bin/bash

# Script to set up a new system with base packages and Oh My Posh

# Check if running as root
if [ "$(id -u)" -eq 0 ]; then
    echo "❌ Please don't run this script directly as root"
    echo "ℹ️ The script will use sudo when necessary"
    exit 1
fi

# Prompt for username if not provided
read -p "👤 Enter username to add to sudo group: " username
if ! id "$username" &>/dev/null; then
    echo "❌ User '$username' does not exist. Please create the user first."
    exit 1
fi

echo "👥 === Adding $username to sudo group ==="
sudo usermod -aG sudo "$username"

echo "📦 === Installing base packages ==="
sudo apt update
sudo apt install -y git curl unzip vim

# Check if Oh My Posh is already installed
if ! command -v oh-my-posh &>/dev/null; then
    echo "🎨 === Installing Oh My Posh ==="
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    echo "🎨 Oh My Posh is already installed"
fi

echo "🔤 === Installing Oh My Posh fonts ==="
oh-my-posh font install meslo

echo "⚙️ === Configuring Oh My Posh for current user ==="
PROFILE_LINE='eval "$(oh-my-posh init bash --config '\''https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json'\'')"'
if ! grep -Fxq "$PROFILE_LINE" "$HOME/.bashrc"; then
    echo "$PROFILE_LINE" >>"$HOME/.bashrc"
fi

echo "✅ === Setup complete! ==="
echo "🔄 Please restart your terminal or run 'source ~/.bashrc' to apply Oh My Posh theme"
