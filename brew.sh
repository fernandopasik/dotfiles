#!/bin/sh
. utils.sh

title "Homebrew"

log "Check & Install OS X Command Line Tools"
xcode-select --install

if [ ! -f "$(command -v brew)" ]; then
  log "Installing Package manager"
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  log "Updating Package manager"
  brew update
fi

touch ~/.Brewfile.custom

log "Do you want to install dev packages? (Y/n)"
MORE=$(prompt "Y")
if [ "$MORE" = "Y" ] || [ "$MORE" = "y" ];
  then
    log "Installing dev packages"
    export HOMEBREW_INSTALL_DEV=true
fi;

log "Do you want to install more dev packages? (Y/n)"
MORE=$(prompt "Y")
if [ "$MORE" = "Y" ] || [ "$MORE" = "y" ];
  then
    log "Installing dev packages"
    export HOMEBREW_INSTALL_DEV_EXTENDED=true
fi;

log "Do you want to install social packages? (Y/n)"
MORE=$(prompt "Y")
if [ "$MORE" = "Y" ] || [ "$MORE" = "y" ];
  then
    log "Installing social packages"
    export HOMEBREW_INSTALL_SOCIAL=true
fi;

log "Do you want to install games packages? (Y/n)"
MORE=$(prompt "Y")
if [ "$MORE" = "Y" ] || [ "$MORE" = "y" ];
  then
    log "Installing games packages"
    export HOMEBREW_INSTALL_GAMES=true
fi;

log "Installing essential packages"
brew bundle --no-lock
