#!/bin/sh

alias ds="du -sh"
is_macos() { [ "$(uname -s)" = "Darwin" ]; }
is_nixos() { [ -e "/etc/nixos" ]; }

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

flush_dns() {
  sudo killall -HUP mDNSResponder
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
  one_line=0
  if [ "$1" = "-s" ]; then
    one_line=1
    shift
  fi

  REPOS=~/repos/
  cd "$REPOS" || exit

  dirs=$(find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)

  max=0
  while IFS= read -r d; do
    len=$(printf "%s" "$d" | wc -c)
    len=$((len - 1))
    [ "$len" -gt "$max" ] && max=$len
  done <<EOF
$dirs
EOF

  while IFS= read -r d; do
    len=$(printf "%s" "$d" | wc -c)
    len=$((len - 1))
    pad=$((max - len + 2))

    if [ $one_line -eq 0 ]; then
      printf "%s\n" "$d"
    else
      printf "%s%*s" "$d" "$pad" ""
    fi

    if [ -d "$d" ] && [ -e "$d/.git" ]; then
      cd "$d" || exit
      "$@"
      cd "$REPOS" || exit
    fi

    [ $# -ne 0 ] && printf "\n"
   done <<EOF
$dirs
EOF

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

git_status() {

  CURRENT_BRANCH=$(git cb)
  CURRENT_BRANCH_ORIGIN=$(git cbo)

  ESC=$(printf "\033")

  STATUS="↪️  ${ESC}[1;96m$CURRENT_BRANCH${ESC}[0m"

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

  printf "%s" "$STATUS"
}
