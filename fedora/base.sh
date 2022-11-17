#! /bin/sh
# Run this script after installing fedora

yellow='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Configuring the system...${nc}\n"
sudo timedatectl set-timezone Asia/Baghdad
echo "Adding the following lines to dnf.conf file"
sudo echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
sudo echo "deltarpm=True" | sudo tee -a /etc/dnf/dnf.conf

printf "${yellow}>>>${nc} ${cyan}Updating the system...${nc}\n"
sudo dnf -y upgrade --refresh

printf "${yellow}>>>${nc} ${cyan}Installing cli apps...${nc}\n"
sudo dnf -y install \
	vim \
	zsh \
	tmux \
	wget \
	curl \
	htop \
	cava \
	cmatrix \
	neofetch \
	util-linux-user \
	transmission-cli \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
mkdir -p $HOME/.config/cava
cp $HOME/.myconfig/dotfiles/cavaconfig $HOME/.config/cava/config
cp $HOME/.myconfig/dotfiles/tmux.conf $HOME/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing fonts...${nc}\n"
# Powerline fonts for console
git clone https://github.com/powerline/fonts.git $HOME/PowerlineFonts
sh $HOME/PowerlineFonts/install.sh
sudo cp $HOME/PowerlineFonts/Terminus/PSF/*.gz /usr/lib/kbd/consolefonts/
sudo mv /etc/vconsole.conf /etc/vconsole.conf.old
sudo cp $HOME/.myconfig/dotfiles/vconsole.conf /etc/vconsole.conf
# Nerd font for powerlevel10k
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME
sudo mv $HOME/*.ttf /usr/share/fonts
# SF fonts for display
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git $HOME/SFPro
sudo cp -rv $HOME/SFPro /usr/share/fonts
# Some other fonts
sudo dnf -y install pt-sans-fonts google-noto-kufi-arabic-fonts google-noto-sans-arabic-fonts

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/.myconfig/dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp $HOME/.myconfig/dotfiles/zshrc $HOME/.zshrc
chsh -s $(which zsh)

printf "${yellow}>>>${nc} ${cyan}Cleaning up the mess...${nc}\n"
rm -rf $HOME/SFPro
rm -rf $HOME/PowerlineFonts
echo done

printf "${yellow}>>>${nc} ${red}System will reboot in 5 seconds${nc}\n"
sleep 5
echo rebooting...
reboot
