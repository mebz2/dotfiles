#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	if [[ $1 == '.' ]]; then
		selected="$HOME/"
	else
		selected=$(find ~/.config ~/ ~/dotfiles/ ~/Documents/ ~/Downloads/ ~/Documents/books ~/Documents/notes/ \
			~/Documents/school/ -mindepth 1 -maxdepth 3 -type d -name "$1" -print -quit)
	fi
else
	selected=$(find ~/ ~/dotfiles/ ~/Documents/ ~/Downloads/ ~/Documents/books ~/Documents/notes/ \
		~/Documents/school/ ~/.config -mindepth 1 -maxdepth 3 -type d | sed "s|^$HOME/||" | \
		fzf --margin 30% --color="bw")
	selected="$HOME/$selected"
fi

cd "$selected"

