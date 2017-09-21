# Set num columns
defaults write com.apple.dock springboard-columns -int 8
# Set num rows
defaults write com.apple.dock springboard-rows -int 7
# Relaunch launchpad
defaults write com.apple.dock ResetLaunchPad -bool TRUE;
# Relaunch dock
killall Dock
