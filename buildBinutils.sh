#!/bin/bash
cd work/

echo "Extracting bintuils source..."
tar -xf binutils-${BINVER}.tar.xz

mkdir binutils-${BINVER}-build
cd binutils-${BINVER}-build
echo "Configuring..."
../binutils-${BINVER}/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
echo "Building..."
make
echo "Make install neeeds sudo"
sudo make install

echo "Binutils done!"
