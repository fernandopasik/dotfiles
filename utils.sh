#!/bin/sh

title() {
  echo
  echo "\033[34;1m$1\033[0m"
  echo
}

log() {
  echo "\033[37;1m$1\033[0m"
}

prompt() {
  read input
  echo ${input:-$1}
}

currentName() {
  echo $(id -F)
}

currentFirstName() {
  echo $(id -F | grep -o "^\S*")
}

currentUser() {
  echo $(whoami)
}

currentEmail() {
  echo $(/usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" ~/Library/Preferences/MobileMeAccounts.plist)
}
