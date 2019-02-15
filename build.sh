#!/bin/bash

# Thank you SO: https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "What system is this compiler targeting?"
read TARGET
echo "What version of binutils are we using?"
read BINVER
echo "And the version of GCC?"
read GCCVER

mkdir -p work
mkdir -p out-${TARGET}

export TARGET=$TARGET
export BINVER=$BINVER
export GCCVER=$GCCVER
export PREFIX="${SCRIPTPATH}/out-${TARGET}"
export TARGET=$TARGET
export PATH="$PREFIX/bin:$PATH"

./getSource.sh
./buildBinutils.sh
./buildGcc.sh
