#!/bin/bash

# Base Packages
echo "📦 === Installing base packages ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl unzip vim

#Cloud-Init - VM Template
echo "☁️ === Installing Cloud-Init and QEMU Guest Agent ==="
sudo apt update && sudo apt install -y cloud-init qemu-guest-agent
sudo cloud-init clean
sudo shutdown now
