# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

# Which plugins would you like to load?
plugins=(osx git npm docker httpie)

# User configuration
export DEFAULT_USER=$(whoami)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin"

source $ZSH/oh-my-zsh.sh

alias up!="brew update >/dev/null; brew outdated;brew upgrade;brew cask outdated;brew cask upgrade;brew cleanup;yarn global upgrade"

alias npmlsg="npm ls -g --depth 0"
alias npmls="npm ls --depth 0"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

source ~/.profile

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
