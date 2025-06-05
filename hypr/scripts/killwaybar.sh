#!/usr/bin/env bash

pid=($(pgrep waybar))

if [[ -n "$pid" ]] then
	kill $pid
fi
