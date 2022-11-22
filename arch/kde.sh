#! /bin/sh

sudo timedatectl set-ntp true

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S \
	xorg \
	plasma \
	dolphin \
	konsole \
	ttf-dejavu \
	sddm \
	flatpak \
	packagekit-qt5 \
	papirus-icon-theme

cp $HOME/.myconfig/dotfiles/tmux.conf $HOME/.tmux.conf

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME
sudo mv $HOME/*.ttf /usr/share/fonts

git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git $HOME/SFPro
sudo cp -rv $HOME/SFPro /usr/share/fonts

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/.myconfig/dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp $HOME/.myconfig/dotfiles/zshrc $HOME/.zshrc
chsh -s $(which zsh)

sudo systemctl enable sddm

rm -rf $HOME/SFPro
rm -rf $HOME/PowerlineFonts
