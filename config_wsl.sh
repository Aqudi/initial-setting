#!/bin/bash

# Step1 ==============
sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt update

# Install required programs
sudo apt install zsh curl nano

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Step2 ==============
# Reopen your terminal

# Add shortcuts
echo 'alias zrc="nano ~/.zshrc"' >>~/.zshrc
echo 'alias src="source ~/.zshrc"' >>~/.zshrc

# Disable color highlighting
echo 'LS_COLORS=$LS_COLORS:"ow=1;34:" ; export LS_COLORS' >>~/.zshrc

# Disable zsh theme to use startship
sed -i 's/ZSH_THEME/#\ ZSH_THEME/' ~/.zshrc

# Install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'eval "$(starship init zsh)"' >>~/.zshrc

# Apply startship configuration
mkdir ~/.config
cp starship.toml ~/.config/starship.toml

# Apply all changes
source ~/.zshrc
