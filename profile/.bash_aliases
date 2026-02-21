#!/bin/sh
alias la='ls -lahA'
alias du1='du -h -d 1 | sort -h'
alias dus='du -sh'

repos() {
  { [ "$1" = "-s" ] && shift; } || [ $# -eq 0 ] && sep='' || sep='\n'
  cd ~/repos/ || exit
  dirs=$(find . -mindepth 2 -maxdepth 2 -name '.git' | sed 's|^\./||;s|/\.git$||' | sort)
  max=$(printf '%s\n' "$dirs" | awk '{ if(length>m) m=length } END{print m}')
  printf '%s\n' "$dirs" | while IFS= read -r d; do
    printf "\n%b%-*s  %b" "$sep" "$max" "$d" "$sep"
    (cd "$d" && "$@")
  done
  printf '\n'
}

up() {
  if command -v brew > /dev/null 2>&1; then
    brew update > /dev/null 2>&1
    brew upgrade
    brew cleanup
  elif command -v apt > /dev/null 2>&1; then
    sudo apt update -qq
    apt list --upgradable 2>/dev/null
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt clean
  fi
}
