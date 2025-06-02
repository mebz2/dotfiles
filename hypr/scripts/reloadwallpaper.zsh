#!/bin/zsh

if [[ -n $(pgrep wallpaper.zsh) ]]; then
	kill $(pgrep wallpaper.zsh)
	~/Documents/bash-scripts/wallpaper.zsh
else
	~/Documents/bash-scripts/wallpaper.zsh
fi
