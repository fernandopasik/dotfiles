#!/bin/sh

current_email() {
  /usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" ~/Library/Preferences/MobileMeAccounts.plist
}

current_first_name() {
  id -F | grep -o "^\S*"
}

current_name() {
  id -F
}

current_user() {
  whoami
}

heading() {
  BLUE='\033[0;34m'
  NC='\033[0m' # No Color
  echo
  echo "${BLUE}$1${NC}"
  echo
}

kcdebug() {
  kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
}

log() {
  echo "\033[37;1m$1\033[0m"
}

prompt() {
  read -r input
  echo "${input:-$1}"
}

repos() {
  REPOS=~/Sites
  cd "$REPOS" || exit
  for d in *; do
    if [[ -d "$d" && -e "$d/.git" ]]; then
      cd "$d" || exit
      "$@"
      echo "$d $(git_super_status | sed -r 's/(%G|%\{|%\})//g')"
      cd "$REPOS" || exit
    else
      echo "$d"
    fi
  done
}

reset_command_line_tools() {
  if [[ $(xcode-select --print-path) == *"CommandLineTools"* ]]; then
    sudo rm -rf $(xcode-select --print-path)
    echo "Command Line Tools deleted"
    xcode-select --install
    echo "Command Line Tools re-installed"
  else
    echo "Command Line Tools not present"
  fi
}
