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
  macos
  minikube
  npm
)

if [ -x "$(command -v kubectl)" ]; then
  plugins+=(kubectl)
fi

# shellcheck source=/dev/null
. "$ZSH"/oh-my-zsh.sh

USR_PATH=/usr/
if [ "$(uname -s)" = "Darwin" ]; then
  USR_PATH=/usr/local/
fi

# shellcheck source=/dev/null
. $USR_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
