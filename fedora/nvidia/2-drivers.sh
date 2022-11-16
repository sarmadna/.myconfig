#! /bin/sh
#This script installs proprietery nvidia drivers
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
printf "Waiting for kernel changes...\n"
sleep 30
sudo reboot
