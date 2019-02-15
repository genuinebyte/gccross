#!/bin/bash
KERNEL=$(uname -r)
if [[ $KERNEL == *"arch"* ]]; then
	echo "Pacman needs sudo."
	sudo pacman -S make bison flex gmp mpfr texinfo
else
	echo "Your distro is not supported. Please install the dependancies on your own."
fi
