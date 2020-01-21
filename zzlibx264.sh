#!/bin/bash
# install libx264
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libx264"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://code.videolan.org/videolan/x264/-/archive/master/x264-master.tar.gz"
echo $NAME will be installed in $ROOTDIR

mkdir -p $ROOTDIR/downloads
cd $ROOTDIR

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

export PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig":"$ROOTDIR/share/pkgconfig":$PKG_CONFIG_PATH

./configure --prefix=$ROOTDIR --enable-shared
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
