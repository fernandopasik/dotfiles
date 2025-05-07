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

is_nixos() {
  if  [ -e "/etc/nixos" ]; then
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

clone_all_repos() {
  USER=$(gh api user --jq .login)
  REPOS_FOLDER=~/repos
  REPOS=$(env PAGER=cat gh repo list --limit 1000 --json name,isArchived --jq '.[] | select(.isArchived == false) | .name')

  echo "📦 Cloning all $USER repos"

  printf '%s\n' "$REPOS" | while IFS= read -r REPO; do
    if ! [ -d "$REPOS_FOLDER/$REPO" ]; then
      gh repo clone "$USER/$REPO" "$REPOS_FOLDER/$REPO"
      echo "🟢 Cloned $USER/$REPO"
    fi
  done
  echo "📦 All repos cloned"
}

repos() {
  REPOS=~/repos/
  cd "$REPOS" || exit
  for d in * .[!.]*; do
    if [ -d "$d" ] && [ -e "$d/.git" ]; then
      cd "$d" || exit

      OUTPUT=$("$@")
      OUTPUT_LINES=$(($(echo "$OUTPUT" | wc -l)))

      printf "%s %s" "$d" "$REPO_LABEL"

      if [ $OUTPUT_LINES -gt 1 ]; then
        printf "\n"
      else
        printf " "
      fi

      if ! [ $# -eq 0 ]; then
        echo "$OUTPUT"
        if [ $OUTPUT_LINES -gt 1 ]; then
          echo
        fi
      else
        echo
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
  elif is_nixos; then
    sudo nixos-rebuild switch --upgrade
  else
    sudo apt update
    apt list --upgradable
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt clean
    sudo npm up -g --no-audit --no-fund --loglevel=error
  fi
}

nix_config() {
  sudo -E code --wait /etc/nixos/configuration.nix && sudo nixos-rebuild switch
}

git_status() {

  CURRENT_BRANCH=$(git cb)
  CURRENT_BRANCH_ORIGIN=$(git cbo)

  STATUS="↪️  \033[1;96m$CURRENT_BRANCH\e[0m"

  if [ "$CURRENT_BRANCH_ORIGIN" ]; then
    COMMITS_BEHIND=$(git behind)
    COMMITS_AHEAD=$(git ahead)

    if [ "$COMMITS_BEHIND" -gt 0 ] || [ "$COMMITS_AHEAD" -gt 0 ]; then
      STATUS="$STATUS "
      if [ "$COMMITS_BEHIND" -gt 0 ]; then
        STATUS="$STATUS↓$COMMITS_BEHIND"
      fi

      if [ "$COMMITS_AHEAD" -gt 0 ]; then
        STATUS="$STATUS↑$COMMITS_AHEAD"
      fi
    fi
  fi

  UNMERGED_FILES=$(git ls-files --unmerged | cut -f2 | sort -u | wc -l)
  UNSTAGED_CHANGED_FILES=$(git diff --name-only | wc -l)
  UNTRACKED_FILES=$(git ls-files --others --exclude-standard | wc -l)
  STAGED_FILES=$(git diff --cached --name-only | wc -l)

  if [ "$UNMERGED_FILES" -eq 0 ] && [ "$UNSTAGED_CHANGED_FILES" -eq 0 ] && [ "$UNTRACKED_FILES" -eq 0 ] && [ "$STAGED_FILES" -eq 0 ]; then
    STATUS="$STATUS ✅"
  else
    if [ "$UNMERGED_FILES" -gt 0 ]; then
      STATUS="$STATUS ❌ $UNMERGED_FILES"
    fi

    if [ "$UNSTAGED_CHANGED_FILES" -gt 0 ]; then
      STATUS="$STATUS ⭕ $UNSTAGED_CHANGED_FILES"
    fi

    if [ "$STAGED_FILES" -gt 0 ]; then
      STATUS="$STATUS ➕ $STAGED_FILES"
    fi

    if [ "$UNTRACKED_FILES" -gt 0 ]; then
      STATUS="$STATUS ...$UNTRACKED_FILES"
    fi
  fi

  STASHED=$(git stash list | wc -l)
  if [ "$STASHED" -gt 0 ]; then
    STATUS="$STATUS 📥 $STASHED"
  fi

  echo "$STATUS"
}
