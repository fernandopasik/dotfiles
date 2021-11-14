#!/bin/sh
. utils.sh

heading "Homebrew"

log "Check & Install OS X Command Line Tools"
xcode-select --install

if [ ! -f "$(command -v brew)" ]; then
  log "Installing Package manager"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  log "Updating Package manager"
  brew update
fi

touch "$HOME"/.Brewfile.custom

PACKAGES="Installing"

ask_brew_install() {
  log "Do you want to install $1 packages? (Y/n)"
  CONFIRM=$(ask "Y")
  if [ "$CONFIRM" = "Y" ] || [ "$CONFIRM" = "y" ]; then
    PACKAGES="$PACKAGES $1,"
    var="HOMEBREW_INSTALL_$2"
    export "$var"=true
  fi
}

ask_brew_install "dev" DEV
ask_brew_install "extended dev" DEV_EXTENDED
ask_brew_install "social" SOCIAL
ask_brew_install "games" GAMES

log "$PACKAGES essential packages"
brew bundle --no-lock
