#!/usr/bin/env bash

# --- Configuration ---
WALLPAPER_DIR="$HOME/dotfiles/hypr/altWallpapers"
# Time in seconds between wallpaper changes
INTERVAL=300 # 10 minutes

# --- Sanity Checks ---
if ! command -v swww &>/dev/null; then
	echo "Error: swww is not installed or not in your PATH."
	exit 1
fi

if ! command -v wal &>/dev/null; then
	echo "Error: wal is not installed or not in your PATH."
	exit 1
fi

if [[ ! -d "$WALLPAPER_DIR" ]]; then
	echo "Error: Wallpaper directory not found at $WALLPAPER_DIR"
	exit 1
fi

# --- Main Logic ---

mapfile -d '' wallpapers < <(find "$WALLPAPER_DIR" -type f -print0)

if [[ "${#wallpapers[@]}" -eq 0 ]]; then
	echo "No wallpapers found in $WALLPAPER_DIR"
	exit 1
fi

playlist=("${wallpapers[@]}")

if [[ -z "$(pgrep swww-daemon)" ]]; then
	echo "Starting swww-daemon..."
	swww-daemon #&
	sleep 1
fi

while true; do
	if [[ "${#playlist[@]}" -eq 0 ]]; then
		echo "Playlist empty. Refilling..."
		playlist=("${wallpapers[@]}")
	fi

	count=${#playlist[@]}
	random_index=$((RANDOM % count))
	WALLPAPER="${playlist[random_index]}"

	# --- MODIFIED SECTION ---
	# Try to set the wallpaper. If it succeeds, run wal and proceed.
	# If it fails, print an error and the loop will continue to the sleep command.
	echo "Attempting to set wallpaper: $WALLPAPER"
	if swww img "$WALLPAPER" \
		--transition-type outer \
		--transition-pos 0.854,0.777 \
		--transition-step 90 \
		--transition-fps 120; then

		# Success! Now run wal and telegram in the background.
		echo "Wallpaper set successfully. Generating colors..."
		(wal -i "$WALLPAPER" -q && wal-telegram -g -r) #&
	else
		# Failure. Report the error but don't exit the script.
		echo "Error: Failed to set wallpaper. It might be corrupted or an unsupported format. Skipping."
	fi

	# Remove the chosen wallpaper from the playlist regardless of success or failure
	# to prevent trying the same broken file repeatedly.
	unset 'playlist[random_index]'
	playlist=("${playlist[@]}")

	# Wait for the specified interval before the next attempt.
	echo "Sleeping for $INTERVAL seconds..."
	sleep "$INTERVAL"
done
