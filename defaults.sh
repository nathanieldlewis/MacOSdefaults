# System - Set Login Message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Hello, Beautiful."

# System - set Host Name
sudo scutil --set ComputerName "Starscream" && \
sudo scutil --set HostName "Starscream" && \
sudo scutil --set LocalHostName "Starscream" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Starscream"

# System - Set Software Update to Check Daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# System - Set Standby Delay to 24 Hours
sudo pmset -a standbydelay 86400

# System - Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# System - Disable animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# System - Disable animations when you open an application from the Dock.
defaults write com.apple.dock launchanim -bool false

# System - Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# System - Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# System - Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# System - Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# System - Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# System - Set ZSH to be Default Shell
brew install zsh && \
sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells' && \
chsh -s $(brew --prefix)/bin/zsh

# System - Set Screensaver to AutoLock
defaults write com.apple.screensaver askForPasswordDelay -int 0

# System - Enable Airdrop over Ethernet and Unsupported Macs
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true



# Dock - Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Dock - Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock - Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Set Dock to autohide
defaults write com.apple.dock autohide -bool true && \
killall Dock

# Add stack of recent applications
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }' && \
killall Dock

# Add Space to dock
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && \
killall Dock

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show All Files
defaults write com.apple.finder AppleShowAllFiles -string YES

# Apple Mail - show attachments as icons
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

# Apple Mail - Stop Copying Full names
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Disable the standard delay in rendering a Web page.
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Show Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Safari - change default fonts
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StandardFontFamily Georgia
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultFontSize 16
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2FixedFontFamily Menlo
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultFixedFontSize 14

# Safari - Enable Developer Menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


# Add iOS & Watch Simulator to Launchpad
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Xcode - Install Developer Tools
xcode-select --install

# Disable Sudden Impact Sensor
sudo pmset -a sms 0

# Finder - show external media
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
killall Finder

# Finder - show Network Show Network Drives
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
killall Finder

# Finder - show full path in title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder - Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder - show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder - set side bar icons to Medium
defaults write -g NSTableViewDefaultSizeMode -int 2

# Finder - disable creation of DS store files on network Drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder - disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder - When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder - Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder - Enable Snap to Grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Finder - Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Finder - Show the ~/Library folder
chflags nohidden ~/Library

# Finder - Show the /Volumes folder
sudo chflags nohidden /Volume

# Hardware - Force TRIM
forcetrim

# System - auto restart on system freeze
sudo systemsetup -setrestartfreeze on

###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
