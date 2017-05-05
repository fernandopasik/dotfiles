#!/bin/sh

ATOM_DIR=~/.atom

if [ ! -d "$ATOM_DIR" ]; then
  mkdir $ATOM_DIR;
fi

# Link atom config
ln -sfn $PWD/configs/atom.cson $ATOM_DIR/config.cson

# Themes
apm i gruvbox-plus-syntax

# Editor
apm i editorconfig
apm i docblockr
apm i autocomplete-paths
apm i color-picker
apm i autoclose-html
apm i atom-beautify

# Utils
apm i auto-update-packages
apm i compare-files
apm i todo-show
apm i goto-definition
apm i escape-utils

# Git
apm i git-blame
apm i git-log
apm i git-time-machine
apm i merge-conflicts

# Syntax Highlighting
apm i language-babel
apm i language-docker
apm i language-liquid
apm i atom-jade

# Linter
apm i linter
apm i linter-eslint
apm i linter-js-yaml
apm i linter-jsonlint
apm i linter-package-json-validator
apm i linter-stylelint
apm i linter-ui-default
apm i linter-write-good
apm i linter-flow

# User Interface
apm i highlight-selected
apm i file-icons
apm i open-recent
apm i pigments
apm i Zen
apm i travis-ci-status
apm i busy-signal

# Minimap
apm i minimap
apm i minimap-bookmarks
apm i minimap-cursorline
apm i minimap-find-and-replace
apm i minimap-git-diff
apm i minimap-highlight-selected
apm i minimap-selection
apm i minimap-pigments
apm i minimap-linter
