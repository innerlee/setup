#!/bin/bash
# install libtiff
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libtiff"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz"
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

mkdir -p build
cd build

cmake -DCMAKE_INSTALL_PREFIX="$ROOTDIR" -G Ninja ..
ninja
ninja install

echo $NAME installed on "$ROOTDIR"
