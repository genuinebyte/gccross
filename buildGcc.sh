#!/bin/bash
cd work/

echo "Extracting gcc source..."
tar -xf gcc-${GCCVER}.tar.xz

mkdir gcc-${GCCVER}-build
cd gcc-${GCCVER}-build
echo "Configuring..."
../gcc-${GCCVER}/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
echo "Building gcc..."
make all-gcc
echo "Building libgcc..."
make all-target-libgcc
echo "Make install-gcc needs sudo."
sudo make install-gcc
echo "Make install-target-libgcc needs sudo."
sudo make install-target-libgcc

echo "GCC done!"
