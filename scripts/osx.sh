#!/usr/bin/env bash

# Thanks @mathiasbynens !
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

###############################################################################
# OS X General Settings                                                       #
###############################################################################

# Use a dark menu bar / dock
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

###############################################################################
# Finder                                                                      #
###############################################################################

# Show the ~/Library folder
chflags nohidden ~/Library

# Calculate all sizes in folders
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool true'

/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:calculateAllSizes" bool'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:calculateAllSizes" bool true'

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Enable feedback when changing volume
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 52
# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Top left screen corner → Put display to sleep
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-tl-modifier -int 0

declare -a apps=(
  Launchpad
  "Google Chrome"
  Facetime
  Messages
  Slack
  WhatsApp
  Notes
  Photos
  Spotify
  Hyper
  Atom
  "Github Desktop"
)

function addAppToDock {
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/$1.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# Delete all dock apps
defaults delete com.apple.dock persistent-apps
# Add apps to Dock
for app in "${apps[@]}"
do
  addAppToDock "$app"
done
# Refresh Dock
killall Dock

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true


###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Safari                                                                      #
###############################################################################

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Custom Apps                                                                 #
###############################################################################

defaults write com.divisiblebyzero.Spectacle StatusItemEnabled -bool false
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spectacle.app", hidden:true, name:"Spectacle"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Lungo.app", hidden:true, name:"Lungo"}'

echo OS X setup finished
