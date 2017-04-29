# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

# Which plugins would you like to load?
plugins=(osx git npm docker httpie)

# User configuration
export DEFAULT_USER=fernandopasik
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

alias up!="brew update >/dev/null; brew outdated;brew upgrade;brew cleanup;yarn global upgrade"
