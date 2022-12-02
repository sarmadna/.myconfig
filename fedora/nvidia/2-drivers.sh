#! /bin/sh
#This script installs proprietery nvidia drivers
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
sudo reboot
