#!/bin/sh

. utils.sh

heading "DOTFILES Installation"

# Install pre-commit hooks
pre-commit install

. brew.sh
. git-setup.sh
. macos.sh
. shell.sh
. dev.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
