#!/bin/sh

cd `dirname $0`

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

title "Git Setup"
ln -sfn $PWD/configs/.gitconfig ~/.gitconfig
echo Git config linked

title "NPM Setup"
source $PWD/scripts/npm.sh

title "Atom Setup"
source $PWD/scripts/atom.sh

title "Install Fonts"
source $PWD/scripts/fonts.sh

title "Setup OS X options"
source $PWD/scripts/osx.sh

title "Shell Setup"
source $PWD/scripts/shell.sh
