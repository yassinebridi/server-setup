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
sudo apt install git nginx unzip -y
sudo snap install certbot --classic
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


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
chmod +x /home/yassine/.oh-my-zsh/oh-my-zsh.sh

echo -e "${BOLDGREEN}### Installing Neovim..${ENDCOLOR}"
sudo apt install neovim -y

echo -e "${BOLDGREEN}### Adding Neovim config${ENDCOLOR}"
mkdir -p ~/.config/nvim
wget -O ~/.config/nvim/init.vim https://raw.githubusercontent.com/yassinebridi/server-setup/master/vim/init.vim

echo -e "${BOLDGREEN}Installing Exa${ENDCOLOR}"
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
unzip exa-linux-x86_64-v0.10.1.zip
sudo mv bin/exa /usr/bin/

echo -e "${BOLDGREEN}Installing Lazydocker${ENDCOLOR}"
wget https://github.com/jesseduffield/lazydocker/releases/download/v0.18.1/lazydocker_0.18.1_Linux_x86_64.tar.gz
tar -xvf lazydocker_0.18.1_Linux_x86_64.tar.gz
sudo mv lazydocker /usr/bin/

echo -e "${BOLDGREEN}Installing Lazygit${ENDCOLOR}"
wget https://github.com/jesseduffield/lazygit/releases/download/v0.34/lazygit_0.34_Linux_x86_64.tar.gz
tar -xvf lazygit_0.34_Linux_x86_64.tar.gz
sudo mv lazygit /usr/bin/

echo -e "${BOLDGREEN}Installing Bat${ENDCOLOR}"
sudo apt install bat

echo -e "${BOLDGREEN}Installing Bottom${ENDCOLOR}"
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_0.6.8_amd64.deb
sudo dpkg -i bottom_0.6.8_amd64.deb
