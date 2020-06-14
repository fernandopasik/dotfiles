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
  id -F
}

currentFirstName() {
  id -F | grep -o "^\S*"
}

currentUser() {
  whoami
}

currentEmail() {
  /usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" ~/Library/Preferences/MobileMeAccounts.plist
}
