#!/bin/bash/
###########################################################################
### Bash script to install my prefered packages on a new ubuntu server. ###
### Yassine Bridi https://yasbr.com                                     ###
### Args: - $1: email, for SSH key generation                           ###
###########################################################################

# Colors
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"

echo -e "${BOLDGREEN}### Updating ubuntu repos${ENDCOLOR}"
sudo apt update -y
sudo apt install software-properties-common -y
sudo apt update -y
sudo apt install git -y

echo -e "${BOLDGREEN}### Installing Zsh..${ENDCOLOR}"
sudo apt install zsh -y

echo -e "${BOLDGREEN}### Installing Oh My Zsh..${ENDCOLOR}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${BOLDGREEN}### Installing Zsh plugins${ENDCOLOR}"

echo -e "${BOLDGREEN}### zsh-autosuggestions${ENDCOLOR}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${BOLDGREEN}### zsh-syntax-highlighting${ENDCOLOR}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -e "${BOLDGREEN}### zsh-completions${ENDCOLOR}"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo -e "${BOLDGREEN}### Adding Zsh config${ENDCOLOR}"
wget -O ~/.zshrc https://raw.githubusercontent.com/yassinebridi/server-setup/master/zsh/.zshrc

echo -e "${BOLDGREEN}### Installing Neovim..${ENDCOLOR}"
sudo apt install neovim -y

echo -e "${BOLDGREEN}### Adding Neovim config${ENDCOLOR}"
mkdir -p ~/.config/nvim
wget -O ~/.config/nvim/init.vim https://raw.githubusercontent.com/yassinebridi/server-setup/master/vim/init.vim

echo -e "${BOLDGREEN}Installing exa, using a prebuilt binary, because it's the only way it would work${ENDCOLOR}"
sudo wget -O /usr/bin/exa https://0x0.st/-B6R.so
sudo chmod +x /usr/bin/exa

echo -e "${BOLDGREEN}Installing Lazydocker${ENDCOLOR}"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo -e "${BOLDGREEN}Installing Lazygit${ENDCOLOR}"
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit -y

echo -e "${BOLDGREEN}Installing Bottom${ENDCOLOR}"
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.4/bottom_0.6.4_amd64.deb
sudo dpkg -i bottom_0.6.4_amd64.deb
