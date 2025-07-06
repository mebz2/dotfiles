!/usr/bin/env bash

if [[ -n $(pgrep waybar) ]]; then
    pkill waybar
    # waybar
else
    waybar
fi
