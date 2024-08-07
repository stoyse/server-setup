#!/bin/bash

# Update package list
sudo apt update

# Install OpenSSH server
sudo apt install -y openssh-server

# Start and enable SSH service
sudo systemctl start ssh
sudo systemctl enable ssh

# Allow SSH through the firewall
sudo ufw allow ssh

echo "SHH Server setup is complete"
