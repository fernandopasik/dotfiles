#!/bin/sh
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
