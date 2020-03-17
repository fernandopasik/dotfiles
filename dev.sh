#!/bin/sh
. utils.sh

title "Dev Env Setup"

# ------------------
log "Node Setup"
# ------------------
nvm install --lts

# ------------------
log "Yarn Setup"
# ------------------

NPM_USERNAME="fernandopasik"
AUTHOR_NAME="Fernando Pasik"
AUTHOR_EMAIL="fernando@pasik.com.ar"
AUTHOR_URL="https://fernandopasik.com"

# Installing yarn global packages
yarn global add \
  npm-check-updates \
  yo \
  firebase-tools \
  imagemin-cli \
  react-native-cli \

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
ln -sfn $PWD/.vscode.json "${VSCODE_USER_FOLDER}/settings.json"

# Install extensions

declare -a extensions=(
  # Docker
  ms-azuretools.vscode-docker
  # EditorConfig
  EditorConfig.EditorConfig
  # Eslint
  dbaeumer.vscode-eslint
  # GitLens
  eamodio.gitlens
  # GraphQL
  kumar-harsh.graphql-for-vscode
  # Jest
  orta.vscode-jest
  # Npm
  eg2.vscode-npm-script
  # Prettier
  esbenp.prettier-vscode
)

for extension in "${extensions[@]}"
do
  code --install-extensions "$extension" --force
done