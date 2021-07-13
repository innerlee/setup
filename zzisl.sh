#!/bin/bash
# install isl
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="isl"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/infrastructure/isl-0.18.tar.bz2"
echo $NAME will be installed in "$ROOTDIR"

echo install gmp first

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

./configure --prefix="$ROOTDIR" --with-gmp-prefix="$ROOTDIR"
make -j"$(nproc)" && make check && make install

echo $NAME installed on "$ROOTDIR"
