#!/bin/sh

NPM_USERNAME="fernandopasik"
AUTHOR_NAME="Fernando Pasik"
AUTHOR_EMAIL="fernando@pasik.com"
AUTHOR_URL="https://fernandopasik.com"

# Updating npm
npm i -g npm@next

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

# Setting up default npm init options
npm set init.author.name $AUTHOR_NAME
npm set init.author.email $AUTHOR_EMAIL
npm set init.author.url $AUTHOR_URL

# Login to npmjs.org
npm adduser
