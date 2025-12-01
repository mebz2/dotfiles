if pacman -Q yay &>/dev/null; then
	echo "Yay is already installed"
	exit 0
else
	pacman -S --noconfirm yay
fi

if pacman -Q yay &>/dev/null; then
	echo "Yay successfully installed"
else
	echo "Yay could not be installed try manually installing it"
fi
