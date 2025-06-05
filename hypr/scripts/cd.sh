#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	if [[ $1 == '.' ]]; then
		selected="$HOME/"
	else
		selected=$(find ~/.config ~/ ~/dotfiles/ ~/Documents/ ~/Downloads/ ~/Documents/books ~/Documents/notes/ ~/Documents/school/ -mindepth 1 -maxdepth 3 -type d -name "$1" -print -quit)
	fi
else
	selected=$(find ~/.config ~/  ~/Documents/ ~/Downloads/ ~/Documents/books ~/Documents/notes/ ~/Documents/school/ -mindepth 1 -maxdepth 1 -type d | sed "s|^$HOME/||" | sk --margin 30% --color="bw")
	selected="$HOME/$selected"
	selected_name=$(basename "$selected" | tr . _)
fi

cd "$selected"

