#A
sudo mdutil -i off -a

#B
sudo dscl . -create /Users/KrypticBit
sudo dscl . -create /Users/KrypticBit UserShell /bin/bash
sudo dscl . -create /Users/KrypticBit RealName "KrypticBit"
sudo dscl . -create /Users/KrypticBit UniqueID 1001
sudo dscl . -create /Users/KrypticBit PrimaryGroupID 80
sudo dscl . -create /Users/KrypticBit NFSHomeDirectory /Users/vncuser
sudo dscl . -passwd /Users/KrypticBit $1
sudo dscl . -passwd /Users/KrypticBit $1
sudo createhomedir -c -u akhil > /dev/null

#C
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 

#D
echo $2 | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | sudo tee /Library/Preferences/com.apple.VNCSettings.txt

#E
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

#F
sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"

#G
sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE

defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true

#H
defaults write com.apple.loginwindow DisableScreenLock -bool true

defaults write com.apple.loginwindow AllowList -string '*'

#I
brew install --cask ngrok
#J
#brew install --cask google-chrome
#K
brew install --cask teamviewer
brew install --cask firefox
brew install --cask folx

#L
#brew  install --cask intellij-idea-ce
#brew install --cask android-studio

#M
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1

#N
ngrok authtoken $3
ngrok tcp 5900 --region=in &
