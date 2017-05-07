#!/bin/sh

ATOM_DIR=~/.atom

if [ ! -d "$ATOM_DIR" ]; then
  mkdir $ATOM_DIR;
fi

# Link atom config
ln -sfn $PWD/configs/atom.cson $ATOM_DIR/config.cson

# Install all starred packages and themes
apm stars --user fernandopasik --install
