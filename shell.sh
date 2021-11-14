#!/bin/sh
. utils.sh

CURRENT_DIR=$PWD

heading "Shell Setup"

# ------------------
log "Oh My Zsh"
# ------------------

OH_MY_ZSH_DIR="$HOME"/.oh-my-zsh/

if [ ! -d "$OH_MY_ZSH_DIR".git ]; then
  log "Installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log "Updating..."
  cd "$OH_MY_ZSH_DIR" || exit
  git pull
  cd "$CURRENT_DIR" || exit
fi

log "Create empty profile file"
touch "$HOME"/.profile

log "Link my zsh config file"
ln -sfn "$PWD"/.zshrc "$HOME"/.zshrc

log "Link my hyper config file"
ln -sfn "$PWD"/.hyper.js "$HOME"/.hyper.js
