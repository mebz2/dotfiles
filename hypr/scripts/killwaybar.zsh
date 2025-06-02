#!/usr/bin/zsh

pid=($(pgrep waybar))

if [[ -n "$pid" ]] then
	kill $pid
fi
