#!/bin/sh

cd `dirname $0`

. .utils

title "DOTFILES Installation"

. .brew
. .git-setup

# Set chrome as default browser
open -a "Google Chrome" --args --make-default-browser

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
