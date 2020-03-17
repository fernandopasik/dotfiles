#!/bin/sh
. utils.sh

title "Git Setup"

log "Link gitconfig file in user home dir"
ln -sfn $PWD/.gitconfig ~/.gitconfig

GIT_USERNAME="Fernando Pasik"
GIT_EMAIL="fernando@pasik.com.ar"

log "What's your git username? ($GIT_USERNAME)"
username=$(prompt "$GIT_USERNAME")
log "What's your git email? ($GIT_EMAIL)"
email=$(prompt "$GIT_EMAIL")

log "Git config user.name and user.email"
cat > ~/.gitconfig.local <<- EOM
[user]
name = $username
email = $email
EOM

log "Git setup done"