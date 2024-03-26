#!/bin/bash
set -e

PKG_NAME="amdgpu-install_6.0.60002-1_all.deb"
PKG_URL="https://repo.radeon.com/amdgpu-install/23.40.2/ubuntu/jammy/$PKG_NAME"

# Download AMDGPU package
wget -q --show-progress "$PKG_URL" -O "$PKG_NAME"

# Install AMDGPU package
apt install -y ./"$PKG_NAME" hashcat

# Modify installation script for Kali Linux compatibility
sed -i 's/ubuntu|linuxmint|debian)/ubuntu|linuxmint|debian|kali)/' /usr/bin/amdgpu-install

# Install
amdgpu-install --no-dkms --usecase=opencl

# Display Hashcat information
hashcat -I

# Clean up downloaded package
rm "$PKG_NAME"
