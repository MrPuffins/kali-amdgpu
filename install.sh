#!/bin/bash
wget https://repo.radeon.com/amdgpu-install/23.40.2/ubuntu/jammy/amdgpu-install_6.0.60002-1_all.deb
sudo apt install -y ./amdgpu-install_6.0.60002-1_all.deb hashcat
sed -i 's/ubuntu|linuxmint|debian)/ubuntu|linuxmint|debian|kali)/g' /usr/bin/amdgpu-install
amdgpu-install --no-dkms --usecase=opencl
hashcat -I
