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

# ------------------
log "VS Code Setup"
# ------------------

# VS Code folder for settings and more
VSCODE_USER_FOLDER=~/Library/Application\ Support/Code/User

# Create settings folder if not exists
mkdir -p "${VSCODE_USER_FOLDER}"

# Link settings file
ln -sfn "$PWD"/.vscode.json "${VSCODE_USER_FOLDER}/settings.json"

# Install extensions

EXTENSIONS="
  ban.spellright
  davidanson.vscode-markdownlint
  dbaeumer.vscode-eslint
  eamodio.gitlens
  editorconfig.editorconfig
  eg2.vscode-npm-script
  esbenp.prettier-vscode
  exiasr.hadolint
  github.github-vscode-theme
  github.vscode-codeql
  github.vscode-pull-request-github
  golang.go
  hbenl.vscode-test-explorer
  kumar-harsh.graphql-for-vscode
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  msjsdiag.vscode-react-native
  orta.vscode-jest
  redhat.vscode-yaml
  runem.lit-plugin
"

for EXTENSION in ${EXTENSIONS}; do
  code --install-extension "${EXTENSION}" --force
done
