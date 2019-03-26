#!/bin/bash

# VS Code folder for settings and more
VSCODE_USER_FOLDER=~/Library/Application\ Support/Code/User

# Create settings folder if not exists
mkdir -p "${VSCODE_USER_FOLDER}"

# Link settings file
 ln -sfn $PWD/settings.json "${VSCODE_USER_FOLDER}/settings.json"
