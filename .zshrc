# shellcheck disable=SC2148

# Path to your oh-my-zsh installation
export ZSH="$HOME"/.oh-my-zsh

export ZSH_THEME="agnoster"

# Which plugins would you like to load?
export plugins=(docker docker-compose git git-prompt golang httpie kubectl minikube npm osx yarn)

# Go config
export GOPATH="$HOME"/.go

# User configuration
DEFAULT_USER=$(whoami)
export DEFAULT_USER
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin:$GOPATH/bin"

# shellcheck source=/dev/null
. "$ZSH"/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Pure prompt init
autoload -U promptinit
promptinit
prompt pure

# shellcheck source=/dev/null
. "$HOME"/.profile

# shellcheck source=/dev/null
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export RUBY_HOME=/usr/local/opt/ruby/bin
export GEM_PATH=/usr/local/opt/ruby/lib/ruby/gems/3.0.0
export GEM_HOME=$GEM_PATH
export PATH=$RUBY_HOME:$GEM_HOME/bin:$PATH

# shellcheck source=utils.sh
. "$HOME"/.dotfiles/utils.sh
