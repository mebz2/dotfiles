if pacman -Q tmux &>/dev/null; then
	echo "Tmux is already installed"
	exit 0
else
	yay -S --noconfirm tmux
fi

if pacman -Q tmux &>/dev/null; then
	echo "Tmux successfully installed"
else
	echo "Tmux could not be installed try manually installing it"
fi
