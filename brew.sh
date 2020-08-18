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

log "Do you want to install only dev packages? (y/N)"
MORE=$(prompt "N")
if [ "$MORE" = "Y" ] || [ "$MORE" = "y" ];
  then
    log "Installing only dev packages"
    brew bundle --no-lock --file Brewfile.dev
  else
    log "Installing all packages"
    brew bundle --no-lock
fi;
