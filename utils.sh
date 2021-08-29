#!/bin/sh

heading() {
  BLUE='\033[0;34m'
  NC='\033[0m' # No Color
  echo
  echo "${BLUE}$1${NC}"
  echo
}

log() {
  echo "\033[37;1m$1\033[0m"
}

prompt() {
  read -r input
  echo "${input:-$1}"
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
