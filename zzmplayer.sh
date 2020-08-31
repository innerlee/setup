#!/bin/bash
# install ccache
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ccache"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://www.mplayerhq.hu/MPlayer/releases/mplayer-export-snapshot.tar.bz2"
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

./configure --prefix="$ROOTDIR"
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
