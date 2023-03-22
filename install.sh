#!/bin/sh

. ./utils.sh

heading "DOTFILES Installation"

. ./brew.sh
. ./git-setup.sh
. ./macos.sh
. ./shell.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
