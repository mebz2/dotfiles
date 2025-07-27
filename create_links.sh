#!/usr/bin/env bash

rm -rf "$HOME/.config/hypr" "$HOME/.config/waybar" "$HOME/.config/rofi" "$HOME/.config/nvim"  "$HOME/.tmux.conf" 

ln -s "$HOME/dotfiles/hypr" "$HOME/.config/hypr"
# uncomment the commented line, and comment the line below that if you want to use a more bloated config
# ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/nightly_nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/rofi" "$HOME/.config/rofi"
ln -s "$HOME/dotfiles/waybar" "$HOME/.config/waybar"
ln -s "$HOME/dotfiles/kitty/" "$HOME/.config/kitty"
ln -s "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
