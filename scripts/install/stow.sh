#!/bin/bash

if pacman -Q stow &>/dev/null; then
	echo "Stow is already installed"
	exit 0
else
	yay -S --noconfirm stow
fi

if pacman -Q stow &>/dev/null; then
	echo "Stow successfully installed"
else
	echo "Stow could not be installed try manually installing it"
fi
