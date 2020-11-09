# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="agnoster"

# Which plugins would you like to load?
plugins=(osx git npm docker httpie)

# User configuration
export DEFAULT_USER=$(whoami)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.config/yarn/global/node_modules/.bin"

source $ZSH/oh-my-zsh.sh

alias yarn_up!="yarn global upgrade 2>&1 | grep -Fv -e 'warning' -e 'info' -e '├─' -e '└─'"
alias up!="brew update >/dev/null; brew outdated;brew upgrade;brew cleanup;yarn_up!"

alias npmlsg="npm ls -g --depth 0"
alias npmls="npm ls --depth 0"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Pure prompt init
autoload -U promptinit; promptinit
prompt pure

source ~/.profile

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export RUBY_HOME=/usr/local/opt/ruby/bin
export GEM_PATH=/usr/local/opt/ruby/lib/ruby/gems/2.7.0
export GEM_HOME=$GEM_PATH
export PATH=$RUBY_HOME:$GEM_HOME/bin:$PATH
