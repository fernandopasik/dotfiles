#!/bin/sh

cd `dirname $0`

. utils.sh

title "DOTFILES Installation"

. brew.sh
. git-setup.sh
. macos.sh
. shell.sh
. dev.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
