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
cask 'logi-options-plus'
cask 'spectacle'
cask 'stats'
cask 'the-unarchiver'
cask 'vlc'

# Browsers
cask 'google-chrome'

# Apps
cask 'google-drive'
cask 'spotify'

# QuickLook plugins
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'webpquicklook'

# Chat
cask 'whatsapp'
cask 'zoom'

if ENV['HOMEBREW_INSTALL_DEV'] || ENV['HOMEBREW_INSTALL_ALL']
  # Git
  brew 'gh'
  brew 'git'
  brew 'git-lfs'

  # Node.js
  brew 'node'
  brew 'nvm'

  # Languages
  brew 'go'
  brew 'openjdk'
  brew 'python'
  brew 'ruby'
  brew 'rust'

  # Shell
  cask 'hyper'

  # OS Utils
  brew 'curl'
  brew 'gnupg'
  brew 'htop'
  brew 'iperf3'
  brew 'neofetch'
  brew 'rsync'
  brew 'wget'

  # Dev Infra
  brew 'dive'
  cask 'docker'
  brew 'hadolint'
  brew 'helm'
  brew 'kubernetes-cli'
  brew 'minikube'

  # Dev Apps
  cask 'font-jetbrains-mono'
  brew 'httpie'
  brew 'qemu'
  cask 'visual-studio-code'

  # Browsers
  cask 'firefox'
  cask 'microsoft-edge'

  # Chat
  cask 'slack'

end

if ENV['HOMEBREW_INSTALL_ALL']
  # Dev Apps
  cask 'android-studio'
  cask 'raspberry-pi-imager'
  cask 'vnc-viewer'

  # Chat
  cask 'discord'
  cask 'messenger'
  cask 'signal'
  cask 'telegram-desktop'

  # Games
  cask 'battle-net'
  cask 'epic-games'
  cask 'gog-galaxy'
  cask 'openemu-experimental'
  cask 'steam'

  #Apps
  cask 'transmission'
end

instance_eval(File.exist?(ENV['HOME'] + "/.Brewfile.custom") ? File.read(ENV['HOME'] + "/.Brewfile.custom") : '')
