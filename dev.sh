#!/bin/sh
. ./utils.sh

export PATH=/usr/local/bin:"$PATH"

heading "Dev Env Setup"

# -------------------------------
log "Create repos folder"
# -------------------------------
mkdir "$HOME"/Sites
touch "$HOME"/Sites/.metadata_never_index

# -------------------------------
log "Node Setup"
# -------------------------------
nvm install --lts
nvm alias default system

# -------------------------------
log "Install package managers with included node.js corepack"
# -------------------------------
corepack enable

# -------------------------------
log "Installing global packages"
# -------------------------------
npm install -g \
  npm \
  npm-check-updates \
  pure-prompt \
  yo

AUTHOR_NAME=$(current_name)
AUTHOR_EMAIL=$(current_email)
AUTHOR_URL="https://$(current_user).com"

# -------------------------------
log "Configure npm init"
# -------------------------------
# Setting up default npm init options
npm config set init-author-email "$AUTHOR_EMAIL"
npm config set init-author-name "$AUTHOR_NAME"
npm config set init-author-url "$AUTHOR_URL"
npm config set init-license UNLICENSED
npm config set init-private true
npm config set init-version 0.0.0

# Login to npm
npm login
