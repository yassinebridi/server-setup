#!/bin/bash/
###########################################################################
### Bash script to install my prefered packages on a new ubuntu server. ###
### Yassine Bridi https://yasbr.com                                     ###
### Args: - $1: email, for SSH key generation                           ###
###########################################################################

echo '### Updating ubuntu repos'
sudo apt update -y

echo '### Installing Zsh..'
sudo apt install zsh -y

echo '### Installing Oh My Zsh..'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '### Installing Zsh plugins'

echo '### zsh-autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo '### zsh-syntax-highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo '### zsh-completions'
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

echo '### Adding Zsh config'
wget -O /root/.zshrc https://raw.githubusercontent.com/yassinebridi/server-setup/master/zsh/.zshrc

echo '### Installing Neovim..'
sudo apt install neovim -y

echo '### Adding Neovim config'
mkdir -p /root/.config/nvim
wget -O /root/.config/nvim/init.vim https://raw.githubusercontent.com/yassinebridi/server-setup/master/vim/init.vim

echo '### Installing Unzip(Needed when installing fnm)..'
sudo apt install unzip -y

echo '### Installing fnm, and installing the latest LTS NodeJS with it'
curl -fsSL https://fnm.vercel.app/install | bash
fnm install

echo "Installing exa, using a prebuilt binary, because it's the only way it would work"
wget -O /usr/bin/exa https://0x0.st/-B6R.so
chmod +x /usr/bin/exa

echo 'Generating a new ssh key'
ssh-keygen -t ed25519 -C "$1"
