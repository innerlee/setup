#!/bin/bash
# install freetype
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="freetype"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://download.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.gz"
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
