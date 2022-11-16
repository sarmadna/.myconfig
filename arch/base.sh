#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc

sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "arch" >> /etc/hostname
echo "127.0.0.1		arch" >> /etc/hosts
echo "::1		arch" >> /etc/hosts
echo "127.0.1.1		arch.localdomain	arch" >> /etc/hosts

sed -i '37s/.//' /etc/pacman.conf
pacman -S \
	sudo \
	grub \
	dialog \
	pipewire \
	firewalld \
	efibootmgr \
	base-devel \
	linux-headers \
	pipewire-alsa \
	pipewire-jack \
	pipewire-pulse \
	wpa_supplicant \
	networkmanager \
	network-manager-applet

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable firewalld

useradd -m -c "Sarmad" sarmad
echo sarmad:1 | chpasswd
usermod -aG wheel sarmad
echo "sarmad ALL=(ALL) ALL" >> /etc/sudoers.d/sarmad

