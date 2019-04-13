#!/bin/sh

cd `dirname $0`

function title {
  echo
  echo "\033[31;1m$1\033[0m"
  echo
}

title "DOTFILES Installation"

title "Install OS X Command Line Tools"
xcode-select --install

title "Install Homebrew"
yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

title "Install Homebrew packages"
brew bundle

# Set chrome as default browser
open -a "Google Chrome" --args --make-default-browser

title "Git Setup"
ln -sfn $PWD/configs/.gitconfig ~/.gitconfig
echo Git config linked

title "Node Setup"
nvm install --lts

title "Yarn Setup"
source $PWD/scripts/yarn.sh

title "Install Fonts"
source $PWD/scripts/fonts.sh

title "Setup OS X options"
source $PWD/scripts/osx.sh

title "Shell Setup"
source $PWD/scripts/shell.sh

title "VS Code Setup"
source $PWD/vscode/setup.sh

# Create empty profile file
touch ~/.profile

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
