#!/bin/sh

cd `dirname $0`

. .utils

title "DOTFILES Installation"

. .brew
. .git-setup
. .macos
. .shell

title "Node Setup"
nvm install --lts

title "Yarn Setup"
source $PWD/scripts/yarn.sh

title "VS Code Setup"
source $PWD/vscode/setup.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
