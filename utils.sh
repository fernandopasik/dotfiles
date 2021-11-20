#!/bin/sh

ask() {
  read -r input
  echo "${input:-$1}"
}

brew_bundle() {
  brew bundle --file "$HOME"/.dotfiles/Brewfile --no-lock "$@"
}

brew_bundle_all() {
  HOMEBREW_INSTALL_ALL=true brew_bundle "$@"
}

brew_bundle_dev() {
  HOMEBREW_INSTALL_DEV=true brew_bundle "$@"
}

command_line_tools_reset() {
  CMD_PATH=$(xcode-select --print-path)
  if test "${CMD_PATH#*CommandLineTools}" != "$CMD_PATH"; then
    sudo rm -rf "$CMD_PATH"
    echo "Command Line Tools deleted"
    xcode-select --install
    echo "Command Line Tools re-installed"
  else
    echo "Command Line Tools not present"
  fi
}

current_email() {
  /usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" "$HOME"/Library/Preferences/MobileMeAccounts.plist
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

dir_size() {
  du -sh "$@"
}

flush_dns() {
  sudo killall -HUP mDNSResponder
}

heading() {
  BLUE='\033[44;97m'
  NC='\033[0m' # No Color
  echo
  echo "${BLUE} $1 ${NC}"
  echo
}

kcdebug() {
  kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
}

log() {
  echo
  echo "\033[37;1m$1\033[0m"
}

past() {
  if [ "$(uname -s)" = "Darwin" ]; then
    D=$(date -v -"$1" '+%a %h %d %H:%M:%S %Y %z')
  else
    D=$(date -d -"$1" '+%a %h %d %H:%M:%S %Y %z')
  fi

  shift
  GIT_AUTHOR_DATE=$D GIT_COMMITTER_DATE=$D "$@"
}

repos() {
  REPOS=$(dirname "$(dirname "$(readlink -n "$HOME/.zshrc")")")
  cd "$REPOS" || exit
  for d in *; do
    if [ -d "$d" ] && [ -e "$d/.git" ]; then
      cd "$d" || exit
      "$@"
      echo "$d $(git_super_status | sed -r 's/(%G|%\{|%\})//g')"
      cd "$REPOS" || exit
    else
      echo "$d"
    fi
  done
}

up() {
  brew update > /dev/null
  brew outdated
  brew upgrade
  brew cleanup
  npm up -g --no-audit --no-fund --loglevel=error
}
