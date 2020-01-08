#!/bin/bash
# install ffmpeg
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ffmpeg"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.ffmpeg.org/releases/ffmpeg-4.2.1.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo install nasm, yasm, libx264, libx265, libvpx

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

PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig"
./configure \
    --prefix=$ROOTDIR \
    --extra-libs=-lpthread \
    --extra-libs=-lm \
    --enable-gpl \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libvpx \
    --enable-nonfree \
    --enable-pic \
    --enable-shared
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
