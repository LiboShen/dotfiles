#!/bin/sh

defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock workspaces-auto-swoosh -bool FALSE
defaults write com.apple.dock mru-spaces -bool FALSE
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool TRUE
killall Dock
