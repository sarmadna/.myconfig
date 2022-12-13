#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Installing KDE...${nc}\n"
sudo dnf -y groupinstall "KDE Plasma Workspaces"

printf "${yellow}>>>${nc} ${cyan}Installing some apps...${nc}\n"
sudo dnf -y install \
	ark \
	firefox \
	papirus-icon-theme

printf "${yellow}>>>${nc} ${cyan}Copying images...${nc}\n"
cp -rv $HOME/.myconfig/images $HOME/Pictures/

printf "${yellow}>>>${nc} ${cyan}Removing some useless apps...${nc}\n"
sudo dnf -y remove \
	kmail \
	kmouth \
	akregator \
	korganizer \
	dnfdragora \
	kdeconnectd \
	kaddressbook \
	setroubleshoot


