#!/bin/bash

# Variables
SHARE="//192.168.178.86/Vault"
MOUNT_POINT="/mnt/Vault"

# Prompt for username and password
read -p "Enter your Samba username: " USERNAME
read -s -p "Enter your Samba password: " PASSWORD
echo

# Create the mount point if it doesn't exist
if [ ! -d "$MOUNT_POINT" ]; then
  sudo mkdir -p "$MOUNT_POINT"
fi

# Mount the Samba share
sudo mount -t cifs "$SHARE" "$MOUNT_POINT" -o username="$USERNAME",password="$PASSWORD",uid=$(id -u),gid=$(id -g)

# Check if the mount was successful
if mountpoint -q "$MOUNT_POINT"; then
  echo "Successfully mounted $SHARE at $MOUNT_POINT"
else
  echo "Failed to mount $SHARE"
fi
