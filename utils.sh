#!/bin/sh
repos() {
  [ "$1" = "-s" ] && { one_line=1; shift; } || one_line=0
  REPOS=~/repos/
  cd "$REPOS" || exit
  dirs=$(find . -mindepth 2 -maxdepth 2 -name '.git' | sed 's|^\./||;s|/\.git$||' | sort)
  max=$(printf '%s\n' "$dirs" | awk '{ if(length>m) m=length } END{print m}')
  printf '%s\n' "$dirs" | while IFS= read -r d; do
    printf "%-*s  " "$max" "$d"
    [ "$one_line" -eq 0 ] && printf "\n"
    (cd "$d" && "$@")
    [ $# -ne 0 ] && printf "\n"
   done
}
