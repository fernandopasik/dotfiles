tap 'homebrew/bundle'
tap 'homebrew/cask'
tap 'homebrew/cask-drivers'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/core'
tap 'homebrew/services'

# Shell
brew 'zsh'
brew 'zsh-syntax-highlighting'

# Essential Apps
cask 'logitech-options'
cask 'spectacle'
cask 'stats'
cask 'the-unarchiver'
cask 'vlc'

# Browsers
cask 'google-chrome'

# Chat
cask 'messenger'
cask 'signal'
cask 'skype'
cask 'telegram-desktop'
cask 'whatsapp'

# Apps
cask 'coconutbattery'
cask 'google-backup-and-sync'
cask 'smcfancontrol'
cask 'spotify'
cask 'transmission'

# QuickLook plugins
cask 'qlimagesize'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'webpquicklook'

if ENV['HOMEBREW_INSTALL_DEV']
  # Languages
  brew 'go'
  brew 'openjdk'
  brew 'python'
  brew 'ruby'
  brew 'rust'

  # Browsers
  cask 'brave-browser'
  cask 'firefox'
  cask 'google-chrome-canary'
  cask 'microsoft-edge'

  # Chat
  cask 'slack'
  cask 'zoom'
  cask 'discord'

  # Dev Tools
  brew 'circleci'
  brew 'dive'
  brew 'gh'
  brew 'git-lfs'
  brew 'git'
  brew 'hadolint'
  brew 'helm'
  brew 'httpie'
  brew 'kubernetes-cli'
  brew 'minikube'
  brew 'nvm'
  brew 'pre-commit'
  brew 'qemu'
  brew 'shellcheck'
  brew 'yarn', args: ['ignore-dependencies']
  cask 'docker'

  # Dev Apps
  cask 'android-studio'
  cask 'font-jetbrains-mono'
  cask 'github'
  cask 'imageoptim'
  cask 'hyper-canary'
  cask 'sequel-pro'
  cask 'visual-studio-code'
  cask 'vnc-viewer'

  # Design Apps
  cask 'miro'
  cask 'sketch'
  cask 'zeplin'

  # QuickLook plugins
  cask 'qlcolorcode'
  cask 'qlmarkdown'
  cask 'qlstephen'
end

if ENV['HOMEBREW_INSTALL_GAMES']
  # Games
  cask 'battle-net'
  cask 'epic-games'
  cask 'openemu-experimental'
  cask 'steam'
end

instance_eval(File.exist?(ENV['HOME'] + "/.Brewfile.custom") ? File.read(ENV['HOME'] + "/.Brewfile.custom") : '')
