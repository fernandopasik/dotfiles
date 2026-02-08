#!/bin/sh
repos() {
  one_line=0
  if [ "$1" = "-s" ]; then
    one_line=1
    shift
  fi

  REPOS=~/repos/
  cd "$REPOS" || exit

  dirs=$(find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

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

git_status() {
  git rev-parse --git-dir > /dev/null || return
  printf "%s" "$(git cbf) $(git cbo 2>/dev/null >/dev/null && git behind-ahead) $(git isclean || git changes) $(git stashcf)"
}
