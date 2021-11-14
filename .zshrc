# shellcheck disable=SC2148

# Path to your oh-my-zsh installation
export ZSH="$HOME"/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# shellcheck disable=SC2034
ZSH_THEME="agnoster"

# Configure auto update
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
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
  macos
  minikube
  npm
  yarn
)

# shellcheck source=/dev/null
. "$ZSH"/oh-my-zsh.sh

# shellcheck source=/dev/null
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ********************************
# ****** User configuration ******
# ********************************

# Default zsh user
DEFAULT_USER=$(whoami)
export DEFAULT_USER

# Bash paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# Ruby setup
export RUBY_HOME=/usr/local/opt/ruby/bin
export PATH=$RUBY_HOME:$PATH

# Ruby gem setup
export GEM_PATH=/usr/local/opt/ruby/lib/ruby/gems/3.0.0
export GEM_HOME=$GEM_PATH
export PATH=$GEM_PATH/bin:$PATH

# Go setup
export GOPATH="$HOME"/.go
export PATH=$GOPATH/bin:$PATH

# NVM setup
export NVM_DIR="$HOME/.nvm"
# This loads nvm
# shellcheck source=/dev/null
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
# shellcheck source=/dev/null
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# VS Code for windows path
if [ -d "$HOME/.vscode-server" ]; then
  VSCODE_BIN_PATH=$(find "$HOME/.vscode-server" -name "code")
  VSCODE_BIN_DIR=$(dirname "$(realpath --relative-to="$HOME" "$VSCODE_BIN_PATH")")
  export PATH=$HOME/$VSCODE_BIN_DIR:$PATH
fi

# Pure prompt init
autoload -U promptinit
promptinit
prompt pure

DOTFILES_DIR=$(dirname "$(readlink -n "$HOME/.zshrc")")

# shellcheck source=utils.sh
. "$DOTFILES_DIR"/utils.sh

# shellcheck source=/dev/null
. "$HOME"/.profile
