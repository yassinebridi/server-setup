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

echo -e "${BOLDGREEN}### Updating ubuntu repos${NOCOLOR}"
sudo apt update -y

echo -e "${BOLDGREEN}### Installing Zsh..${NOCOLOR}"
sudo apt install zsh -y

echo -e "${BOLDGREEN}### Installing Oh My Zsh..${NOCOLOR}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "${BOLDGREEN}### Installing Zsh plugins${NOCOLOR}"

echo -e "${BOLDGREEN}### zsh-autosuggestions${NOCOLOR}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${BOLDGREEN}### zsh-syntax-highlighting${NOCOLOR}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -e "${BOLDGREEN}### zsh-completions${NOCOLOR}"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo -e "${BOLDGREEN}### Adding Zsh config${NOCOLOR}"
wget -O /root/.zshrc https://raw.githubusercontent.com/yassinebridi/server-setup/master/zsh/.zshrc

echo -e "${BOLDGREEN}### Installing Neovim..${NOCOLOR}"
sudo apt install neovim -y

echo -e "${BOLDGREEN}### Adding Neovim config${NOCOLOR}"
mkdir -p /root/.config/nvim
wget -O /root/.config/nvim/init.vim https://raw.githubusercontent.com/yassinebridi/server-setup/master/vim/init.vim

echo -e "${BOLDGREEN}### Installing Unzip(Needed when installing fnm)..${NOCOLOR}"
sudo apt install unzip -y

echo -e "${BOLDGREEN}### Installing fnm, and installing the latest LTS NodeJS with it${NOCOLOR}"
curl -fsSL https://fnm.vercel.app/install | bash
fnm install

echo -e "${BOLDGREEN}Installing exa, using a prebuilt binary, because it's the only way it would work${NOCOLOR}"
wget -O /usr/bin/exa https://0x0.st/-B6R.so
chmod +x /usr/bin/exa

echo -e "${BOLDGREEN}Generating a new ssh key${NOCOLOR}"
ssh-keygen -t ed25519 -C "$1"
