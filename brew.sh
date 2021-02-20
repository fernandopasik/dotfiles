#!/bin/sh
. utils.sh

title "Homebrew"

log "Check & Install OS X Command Line Tools"
xcode-select --install

if [ ! -f "$(command -v brew)" ]; then
  log "Installing Package manager"
  yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

log "Installing essential packages"
brew bundle --no-lock
