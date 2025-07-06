#!/bin/bash

# Use slurp to select area, grim to capture, and pipe to wl-copy
area=$(slurp)
if [ -n "$area" ]; then
    grim -g "$area" - | wl-copy --type image/png
    notify-send "Screenshot copied to clipboard"
else
    notify-send "Screenshot cancelled"
fi
