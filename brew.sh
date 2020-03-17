#!/bin/sh
. utils.sh

title "Homebrew"

log "Check & Install OS X Command Line Tools"
xcode-select --install

which -s brew
if [[ $? != 0 ]] ; then
  log "Installing Package manager"
  yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  log "Updating Package manager"
  brew update
fi

log "Install packages"
brew bundle --no-lock