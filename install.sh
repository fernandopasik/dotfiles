#!/bin/sh

. ./utils.sh

. ./macos.sh

# Restart computer
osascript -e 'tell app "loginwindow" to «event aevtrrst»'
