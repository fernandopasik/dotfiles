#!/bin/sh

. ./utils.sh

heading "DOTFILES Installation"

. ./macos.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
