#!/usr/bin/env bash

if [[ -n $(pgrep wallpaper.sh) ]]; then
	kill $(pgrep wallpaper.sh)
	$HOME/dotfiles/hypr/scripts/wallpaper.sh
else
	$HOME/dotfiles/hypr/scripts/wallpaper.sh
fi
