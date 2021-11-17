#!/bin/bash

# Step1 ==============
# package update
sudo apt update

# install required programs
sudo apt install zsh curl nano

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Step2 ==============
# add shortcuts
echo 'alias zrc="nano ~/.zshrc"' >>~/.zshrc
echo 'alias src="source ~/.zshrc"' >>~/.zshrc

# disable color highlighting
echo 'LS_COLORS=$LS_COLORS:"ow=1;34:" ; export LS_COLORS' >>~/.zshrc

# disable zsh theme to use startship
sed -i 's/ZSH_THEME/#\ ZSH_THEME/' ~/.zshrc

# install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'eval "$(starship init zsh)"' >>~/.zshrc

# apply startship configuration
cp starship.toml ~/.config/starship.toml

# apply all changes
source ~/.zshrc
