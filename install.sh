#!/bin/sh

cd `dirname $0`

. .utils

title "DOTFILES Installation"

. .brew
. .git-setup
. .macos
. .shell
. .dev

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
