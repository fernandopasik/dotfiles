#!/bin/sh

NPM_USERNAME="fernandopasik"
AUTHOR_NAME="Fernando Pasik"
AUTHOR_EMAIL="fernando@pasik.com"
AUTHOR_URL="https://fernandopasik.com"

# Installing yarn global packages
yarn global add \
  npm-check-updates \
  yo \
  firebase-tools \
  imagemin-cli \
  react-native-cli \

# Setting up username
npm set username $NPM_USERNAME
npm set email $AUTHOR_EMAIL

# Setting up default yarn init options
yarn config set init-author-url $AUTHOR_URL
yarn config set init-author-email $AUTHOR_EMAIL
yarn config set init-author-name $AUTHOR_NAME
yarn config set init-license UNLICENSED
yarn config set init-version 0.0.0
yarn config set init-private true

# Login to npmjs.org
npm adduser
