#!/bin/sh

function title {
  WIDTH=80
  PADDING=$(($WIDTH - ${#1}))
  echo
  printf "\033[44;97m%*s\n" $WIDTH
  printf "%*s%*s\n" $(( $PADDING / 2 + ${#1} )) "$1" $(( $PADDING / 2 + $PADDING % 2 ))
  printf "%*s\n\033[0;0m" $WIDTH
  echo
}

title "DOTFILES Installation"

title "Install OS X Command Line Tools"
xcode-select --install

title "Install Homebrew"
yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

title "Install Homebrew packages"
brew bundle

title "Shell Setup"
source scripts/shell.sh

title "Git Setup"
ln -sfn $PWD/configs/.gitconfig ~/.gitconfig
echo Git config linked

title "NPM Setup"
source scripts/npm.sh

title "Atom Setup"
source scripts/atom.sh
