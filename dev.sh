#!/bin/sh
. utils.sh

export PATH=/usr/local/bin:$PATH

heading "Dev Env Setup"

# -------------------------------
log "Create repos folder"
# -------------------------------
mkdir ~/Sites
touch ~/Sites/.metadata_never_index

# -------------------------------
log "Node Setup"
# -------------------------------
nvm install --lts
nvm alias default system

# -------------------------------
log "Installing global packages"
# -------------------------------
npm install -g \
  npm \
  npm-check-updates \
  pure-prompt \
  yo

# -------------------------------
log "Yarn Setup"
# -------------------------------
AUTHOR_NAME=$(current_name)
AUTHOR_EMAIL=$(current_email)
AUTHOR_URL="https://$(current_user).com"

# Setting up default yarn init options
yarn config set init-author-url "$AUTHOR_URL"
yarn config set init-author-email "$AUTHOR_EMAIL"
yarn config set init-author-name "$AUTHOR_NAME"
yarn config set init-license UNLICENSED
yarn config set init-version 0.0.0
yarn config set init-private true

# Login to yarn
yarn login
