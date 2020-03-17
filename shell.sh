#!/bin/sh
. utils.sh

CURRENT_DIR=$PWD

title "Shell Setup"

# ------------------
log "Install Fonts"
# ------------------

FONTS_DIR=~/Library/Fonts
POWERLINE_FONTS_DIR=$FONTS_DIR/powerline/

if [ ! -d $POWERLINE_FONTS_DIR/.git ]
then
  git clone --depth 1 https://github.com/powerline/fonts.git $POWERLINE_FONTS_DIR
else
  cd $POWERLINE_FONTS_DIR
  git pull
  cd $CURRENT_DIR
fi

log "Create empty profile file"
touch ~/.profile

log "Link my zsh config file"
ln -sfn $PWD/.zshrc ~/.zshrc

log "Link my hyper config file"
ln -sfn $PWD/.hyper.js ~/.hyper.js

# ------------------
log "Oh My Zsh"
# ------------------

OH_MY_ZSH_DIR=~/.oh-my-zsh/

if [ ! -d $OH_MY_ZSH_DIR.git ]
then
  log "Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  log "Updating..."
  cd $OH_MY_ZSH_DIR
  git pull
  cd $CURRENT_DIR
fi
