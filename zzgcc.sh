#!/bin/zsh
# install gcc
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="gcc"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.5.0/gcc-7.5.0.tar.gz" # for CUDA10
# DOWNLOADURL="http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-9.1.0/gcc-9.1.0.tar.gz" # for CUDA11 ? 老机器上可能会失败。
echo $NAME will be installed in "$ROOTDIR"

echo CUDA 11 support up to gcc 9, CUDA 10 support up to gcc 7, CUDA 9 support up to gcc 5.

echo Building GCC requires GMP 4.2+, MPFR 2.4.0+ and MPC 0.8.0+.

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

./contrib/download_prerequisites
# ./configure --prefix="$ROOTDIR" --with-gmp="$ROOTDIR" --with-mpfr="$ROOTDIR" \
# --with-mpc="$ROOTDIR" --with-isl="$ROOTDIR" \
# --disable-multilib --enable-languages=c,c++,fortran \
# --enable-bootstrap --enable-checking=release

# ./configure --prefix="$ROOTDIR" --with-gmp-prefix="$ROOTDIR" --with-mpfr="$ROOTDIR" --with-mpc="$ROOTDIR" --with-isl="$ROOTDIR" --disable-checking --disable-multilib --enable-threads=posix --enable-languages=c,c++,fortran \
./configure --prefix="$ROOTDIR" --disable-checking --disable-multilib --enable-threads=posix --enable-languages=c,c++,fortran

make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"