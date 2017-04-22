#!/bin/sh

OH_MY_ZSH_DIR=~/.oh-my-zsh/
POWERLINE_FONT_DIR=~/Library/Fonts/powerline/
CURRENT_DIR=$PWD

# Install Oh My Zsh
if [ ! -d $OH_MY_ZSH_DIR.git ]
then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  cd $OH_MY_ZSH_DIR
  git pull
  cd $CURRENT_DIR
fi

# Link my zsh config file
ln -sfn $PWD/configs/.zshrc ~/.zshrc

# Link my hyper config file
ln -sfn $PWD/configs/.hyper.js ~/.hyper.js

# Install Powerline fonts
if [ ! -d $POWERLINE_FONT_DIR.git ]
then
  git clone --depth 1 https://github.com/powerline/fonts.git ~/Library/Fonts/powerline
else
  cd $POWERLINE_FONT_DIR
  git pull
  cd $CURRENT_DIR
fi

# Startup zsh config
source ~/.zshrc
