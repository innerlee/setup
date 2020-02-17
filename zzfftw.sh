#!/bin/bash
# install fftw
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="fftw"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://www.fftw.org/fftw-3.3.8.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

# double precision arithmetic
./configure --prefix="$ROOTDIR"   \
            --enable-shared     \
            --enable-threads    \
            --enable-sse2       \
            --enable-avx        &&
make -j"$(nproc)" && make install

# single precision
make clean &&
./configure --prefix="$ROOTDIR"   \
            --enable-shared     \
            --enable-threads    \
            --enable-sse2       \
            --enable-avx        \
            --enable-float      &&
make -j"$(nproc)" && make install

# long double precision
make clean &&
./configure --prefix="$ROOTDIR"       \
            --enable-shared         \
            --enable-threads        \
            --enable-long-double    &&
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
