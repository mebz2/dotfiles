#!/usr/bin/zsh

WALLPAPER_DIR="$HOME/dotfiles/hypr/altWallpapers"
INTERVAL=500

while true; do
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    
    if ! pgrep -x swww > /dev/null; then
        swww-daemon &
        sleep 1  # Wait for daemon to initialize
    fi

    swww img "$WALLPAPER" --transition-type wipe && wal -i "$WALLPAPER"
	wal-telegram -g -r
    sleep $INTERVAL
done
