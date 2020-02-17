#!/bin/bash
# install aria2
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="aria2"
TYPE=".tar.xz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.xz"
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

export CFLAGS="-I$ROOTDIR/include"
export CPPFLAGS="-I$ROOTDIR/include"
export LDFLAGS="-L$ROOTDIR/lib"
export PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig:$ROOTDIR/share/pkgconfig:"$PKG_CONFIG_PATH

./configure --prefix="$ROOTDIR"
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
