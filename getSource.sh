#!/bin/bash
RED='\e[91m'
YELLOW='\e[93m'
GREEN='\e[92m'
RESET='\e[39m'

if [ -f work/binutils-${BINVER}.tar.xz ]; then
	echo "Binutils ource archive exists. Skipping fetch."
else
	BINURL="https://ftp.gnu.org/gnu/binutils/binutils-${BINVER}.tar.xz"
	CODE=$(curl -sI ${BINURL} | grep -om 1 "\([0-9]\{3\}\)")
	if [ $CODE -ne 200 ]; then
		echo -e "${RED}[-]${RESET} No version with that number!"
		exit
	fi

	echo "Fetching binutils source..."
	curl --progress-bar -o work/binutils-${BINVER}.tar.xz ${BINURL}
fi

if [ -e work/gcc-${GCCVER}.tar.xz ]; then
	echo "GCC source exists. Skipping fetch."
else
	GCCURL="https://ftp.gnu.org/gnu/gcc/gcc-${GCCVER}/gcc-${GCCVER}.tar.xz";
	CODE=$(curl -sI ${GCCURL} | grep -om 1 "\([0-9]\{3\}\)")
	if [ $CODE -ne 200 ]; then
		echo -e "${RED}[-]${RESET} No version with that number!"
		exit
	fi

	echo "Fetching gcc source..."
	curl --progress-bar -o work/gcc-${GCCVER}.tar.xz ${GCCURL}
fi
