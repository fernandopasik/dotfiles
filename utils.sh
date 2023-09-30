#!/bin/sh

BASEDIR=$(dirname "$0")

brew_bundle() {
  brew bundle --file "$BASEDIR"/Brewfile --no-lock "$@"
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

dir_size() {
  du -sh "$@"
}

flush_dns() {
  sudo killall -HUP mDNSResponder
}

is_macos() {
  if [ "$(uname -s)" = "Darwin" ]; then
    return 0
  else
    return 1
  fi
}

kcdebug() {
  kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh
}

past() {
  if is_macos; then
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
  for d in * .[!.]*; do
    if [ -d "$d" ] && [ -e "$d/.git" ]; then
      cd "$d" || exit

      OUTPUT_LINES=$(($("$@" | wc -l) + 1))
      REPO_LABEL=$(git_super_status | sed -r 's/(%G|%\{|%\})//g')

      printf "%s %s" "$d" "$REPO_LABEL"

      if [ $OUTPUT_LINES -gt 1 ]; then
        printf "\n"
      else
        printf " "
      fi

      if ! [ $# -eq 0 ]; then
        "$@"
        echo
        if [ $OUTPUT_LINES -gt 1 ]; then
          echo
        fi
      fi
      cd "$REPOS" || exit
    elif [ -d "$d" ]; then
      echo "$d"
    fi
  done
}

up() {
  if is_macos; then
    brew update > /dev/null
    brew outdated
    brew upgrade
    brew cleanup
    npm up -g --no-audit --no-fund --loglevel=error
  else
    sudo apt update
    apt list --upgradable
    sudo apt upgrade -y
    sudo apt autoremove
    sudo apt clean
    sudo npm up -g --no-audit --no-fund --loglevel=error
  fi
}
