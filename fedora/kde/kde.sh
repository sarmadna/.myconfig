#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing some apps...${nc}\n"
sudo dnf -y install \
	ark \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Removing some useless apps...${nc}\n"
sudo dnf -y remove \
	kmail \
	akregator \
	kaddressbook

