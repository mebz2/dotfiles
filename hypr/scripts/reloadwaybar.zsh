!/bin/zsh

if [[ -n $(pgrep waybar) ]]; then
	pkill waybar
	waybar
else 
	waybar
fi
