#!/bin/sh

. ./utils.sh

heading "DOTFILES Installation"

. ./brew.sh
. ./git-setup.sh
. ./macos.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
