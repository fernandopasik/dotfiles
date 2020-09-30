#!/bin/sh
. utils.sh

export PATH=/usr/local/bin:$PATH

title "Dev Env Setup"

# ------------------
log "Node Setup"
# ------------------
nvm install 14

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
  yo \

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
VSCODE_USER_FOLDER=~/Library/Application\ Support/Code\ -\ Insiders/User

# Create settings folder if not exists
mkdir -p "${VSCODE_USER_FOLDER}"

# Link settings file
ln -sfn "$PWD"/.vscode.json "${VSCODE_USER_FOLDER}/settings.json"

# Alias beta vscode as non-beta
mv /usr/local/bin/code-insiders /usr/local/bin/code

# Install extensions

EXTENSIONS="
  dart-code.dart-code
  dart-code.flutter
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  EditorConfig.EditorConfig
  dbaeumer.vscode-eslint
  eamodio.gitlens
  kumar-harsh.graphql-for-vscode
  orta.vscode-jest
  eg2.vscode-npm-script
  esbenp.prettier-vscode
  runem.lit-plugin
  github.vscode-pull-request-github
  github.github-vscode-theme
"

for EXTENSION in ${EXTENSIONS}
do
  code --install-extension "${EXTENSION}" --force
done
