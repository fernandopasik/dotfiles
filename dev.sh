#!/bin/sh
. utils.sh

title "Dev Env Setup"

# ------------------
log "Node Setup"
# ------------------
nvm install 14

# ------------------
log "Yarn Setup"
# ------------------

NPM_USERNAME=$(currentUser)
AUTHOR_NAME=$(currentName)
AUTHOR_EMAIL=$(currentEmail)
AUTHOR_URL="https://$(currentUser).com"

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
VSCODE_USER_FOLDER=~/Library/Application\ Support/Code\ -\ Insiders/User

# Create settings folder if not exists
mkdir -p "${VSCODE_USER_FOLDER}"

# Link settings file
ln -sfn $PWD/.vscode.json "${VSCODE_USER_FOLDER}/settings.json"

# Alias beta vscode as non-beta
mv /usr/local/bin/code-insiders /usr/local/bin/code

# Install extensions

declare -a extensions=(
  # Docker
  ms-azuretools.vscode-docker
  # Kubernetes
  ms-kubernetes-tools.vscode-kubernetes-tools
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
  # Lit-html
  runem.lit-plugin
  # Github Pull Requests
  github.vscode-pull-request-github
  # Github Theme
  github.github-vscode-theme
)

for extension in "${extensions[@]}"
do
  code-insiders --install-extension "$extension" --force
done
