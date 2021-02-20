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

# Chat
cask 'discord'
cask 'messenger'
cask 'signal'
cask 'skype'
cask 'telegram-desktop'
cask 'whatsapp'

# Apps
cask 'coconutbattery'
cask 'google-backup-and-sync'
cask 'imageoptim'
cask 'miro'
cask 'sketch'
cask 'smcfancontrol'
cask 'spotify'
cask 'transmission'
cask 'vnc-viewer'
cask 'zeplin'

# Games
cask 'battle-net'
cask 'epic-games'
cask 'openemu-experimental'
cask 'steam'

if ENV['HOMEBREW_INSTALL_DEV']
  # Languages
  brew 'go'
  brew 'openjdk'
  brew 'python'
  brew 'ruby'
  brew 'rust'
end

instance_eval(File.exist?("../.Brewfile.custom") ? File.read("../.Brewfile.custom") : '')
