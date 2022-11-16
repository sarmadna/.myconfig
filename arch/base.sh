#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'


printf "${yellow}>>>${nc} ${cyan}Setting up the system...${nc}\n"
printf "${yellow}>>>${nc} ${cyan}	Timezone${nc}\n"
ln -sf /usr/share/zoneinfo/Asia/Baghdad /etc/localtime
hwclock --systohc

printf "${yellow}>>>${nc} ${cyan}	Locale${nc}\n"
sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

printf "${yellow}>>>${nc} ${cyan}	Hosts${nc}\n"
echo "arch" >> /etc/hostname
echo "127.0.0.1		arch" >> /etc/hosts
echo "::1		arch" >> /etc/hosts
echo "127.0.1.1		arch.localdomain	arch" >> /etc/hosts

printf "${yellow}>>>${nc} ${cyan}	Packages${nc}\n"
sed -i '37s/.//' /etc/pacman.conf
pacman -S \
	sudo \
	grub \
	dialog \
	firewalld \
	efibootmgr \
	wpa_supplicant \
	networkmanager \
	network-manager-applet

printf "${yellow}>>>${nc} ${cyan}	Grub${nc}\n"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

printf "${yellow}>>>${nc} ${cyan}	Services${nc}\n"
systemctl enable NetworkManager
systemctl enable firewalld

printf "${yellow}>>>${nc} ${cyan}	Users${nc}\n"
useradd -m -c "Sarmad" sarmad
usermod -aG wheel sarmad
passwd sarmad
echo "sarmad ALL=(ALL) ALL" >> /etc/sudoers.d/sarmad

