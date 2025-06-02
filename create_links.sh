#!/usr/bin/env bash

rm -rf "$HOME/.config/hypr" "$HOME/.config/waybar" "$HOME/.config/rofi" "$HOME/.config/nvim"  

ln -s "$HOME/dotfiles/hypr" "$HOME/.config/hypr"
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/rofi" "$HOME/.config/rofi"
ln -s "$HOME/dotfiles/waybar" "$HOME/.config/waybar"
