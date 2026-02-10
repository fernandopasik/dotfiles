#!/bin/sh
repos() {
  [ "$1" = "-s" ] && { one_line=1; shift; } || one_line=0
  REPOS=~/repos/
  cd "$REPOS" || exit
  dirs=$(find . -mindepth 1 -maxdepth 1 -type d | sed 's|^\./||' | sort)
  max=$(printf '%s\n' "$dirs" | awk '{ if(length>m) m=length } END{print m}')

  printf '%s\n' "$dirs" | while IFS= read -r d; do
    if [ "$one_line" -eq 0 ]; then
      printf "%s\n" "$d"
    else
      printf "%-*s  " "$max" "$d"
    fi
    [ -e "$d/.git" ] && ( cd "$d" && "$@" )
    [ $# -ne 0 ] && printf "\n"
   done
}
