#!/bin/sh

function title {
  WIDTH=80
  PADDING=$(($WIDTH - ${#1}))
  printf "\033[44;97m%*s\n" $WIDTH
  printf "%*s%*s\n" $(( $PADDING / 2 + ${#1} )) "$1" $(( $PADDING / 2 + $PADDING % 2 ))
  printf "%*s\n\033[0;0m" $WIDTH
}

title "DOTFILES Installation"
