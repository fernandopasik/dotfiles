#!/bin/sh
. utils.sh

export PATH=/usr/local/bin:$PATH

title "Dev Env Setup"

# ------------------
log "Create repos folder"
# ------------------

mkdir ~/Sites
touch ~/Sites/.metadata_never_index

# ------------------
log "Node Setup"
# ------------------
nvm install --lts
nvm alias default system

# ------------------
log "Yarn Setup"
# ------------------

AUTHOR_NAME=$(currentName)
AUTHOR_EMAIL=$(currentEmail)
AUTHOR_URL="https://$(currentUser).com"

# Installing yarn global packages
yarn global add \
  npm-check-updates \
  pure-prompt \
  yo

# Setting up default yarn init options
yarn config set init-author-url "$AUTHOR_URL"
yarn config set init-author-email "$AUTHOR_EMAIL"
yarn config set init-author-name "$AUTHOR_NAME"
yarn config set init-license UNLICENSED
yarn config set init-version 0.0.0
yarn config set init-private true

# Login to yarn
yarn login
