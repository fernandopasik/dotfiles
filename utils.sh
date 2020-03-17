#!/bin/sh

function title {
  echo
  echo "\033[34;1m$1\033[0m"
  echo
}

function log {
  echo "\033[37;1m$1\033[0m"
}

function prompt {
  read input
  echo ${input:-$1}
}