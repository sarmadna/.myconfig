#! /bin/sh

yellow='\033[1;33m'
cyan='\033[1;36m'
nc='\033[0m'

printf "${yellow}>>>${nc} ${cyan}Setting up Vim...${nc}\n"
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $HOME/myconfig/dotfiles/vimrc $HOME/.vimrc
vim +PluginInstall +qall
cp $HOME/myconfig/dotfiles/tmux.conf $HOME/.tmux.conf

printf "${yellow}>>>${nc} ${cyan}Installing zsh and oh-my-zsh...${nc}\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp $HOME/myconfig/dotfiles/zshrc $HOME/.zshrc
