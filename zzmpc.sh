#!/bin/bash
# install mpc
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="mpc"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

echo install gmp and mpfr first

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
tar xfz downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

./configure --prefix="$ROOTDIR" --with-gmp="$ROOTDIR" --with-mpfr="$ROOTDIR"
make -j"$(nproc)" && make check && make install

echo $NAME installed on "$ROOTDIR"
