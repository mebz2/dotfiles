#!/usr/bin/env bash

# The full path to your wallpaper script
WALLPAPER_SCRIPT_PATH="$HOME/dotfiles/scripts/wallpaper.sh"

# Find and kill any existing instances of the wallpaper script
# -f matches against the full command line
# -x matches the name exactly
# We grep -v for pkill to ensure we don't kill the pkill process itself
if pgrep -f -x "bash $WALLPAPER_SCRIPT_PATH" >/dev/null; then
    echo "Found running wallpaper script. Killing it..."
    pkill -f -x "bash $WALLPAPER_SCRIPT_PATH"
    # Optional: wait a moment for the process to terminate cleanly
    sleep 0.1
fi

echo "Starting new wallpaper script instance..."
# Start the script in the background so it doesn't block the keybinding
nohup "$WALLPAPER_SCRIPT_PATH" >/dev/null 2>&1 &

# Optional: Send a notification
# notify-send "Wallpaper Script" "Reloaded successfully!" -i "dialog-information"
