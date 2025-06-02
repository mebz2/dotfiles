#!/usr/bin/zsh

WALLPAPER_DIR="~/.config/hypr/altWallpapers"
INTERVAL=300  # Change wallpaper every ~2.5 minutes

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    
    if ! pgrep -x swww > /dev/null; then
        swww-daemon &
        sleep 1  # Wait for daemon to initialize
    fi

    swww img "$WALLPAPER" --transition-type fade && wal -i "$WALLPAPER"
    sleep $INTERVAL
done
