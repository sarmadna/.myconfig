#! /bin/sh
#This script automatically signs kernel modules
sudo dnf upgrade --refresh -y
sudo dnf install -y kmodtool akmods mokutil openssl
sudo kmodgenca -a
sudo mokutil --import /etc/pki/akmods/certs/public_key.der
sudo reboot
