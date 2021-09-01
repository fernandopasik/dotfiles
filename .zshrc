# shellcheck disable=SC2148

# Path to your oh-my-zsh installation
export ZSH="$HOME"/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# shellcheck disable=SC2034
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# shellcheck disable=SC2034
plugins=(
  docker
  docker-compose
  emoji
  gem
  gh
  git
  git-prompt
  golang
  httpie
  kubectl
  minikube
  npm
  osx
  yarn
)

# shellcheck source=/dev/null
. "$ZSH"/oh-my-zsh.sh

# shellcheck source=/dev/null
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ********************************
# ****** User configuration ******
# ********************************

DEFAULT_USER=$(whoami)
export DEFAULT_USER

# Go config
export GOPATH="$HOME"/.go

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin:$GOPATH/bin"

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Pure prompt init
autoload -U promptinit
promptinit
prompt pure

export RUBY_HOME=/usr/local/opt/ruby/bin
export GEM_PATH=/usr/local/opt/ruby/lib/ruby/gems/3.0.0
export GEM_HOME=$GEM_PATH
export PATH=$RUBY_HOME:$GEM_HOME/bin:$PATH

# shellcheck source=utils.sh
. "$HOME"/.dotfiles/utils.sh

# shellcheck source=/dev/null
. "$HOME"/.profile
