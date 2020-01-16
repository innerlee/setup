#!/bin/bash
# install libvpx
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libvpx"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://chromium.googlesource.com/webm/libvpx.git/+archive/refs/heads/master.tar.gz"
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
tar xf downloads/$FILE -C src/$NAME
cd src/$NAME

export CXXFLAGS=' -fPIC'
export CFLAGS=' -fPIC'

./configure --prefix="$ROOTDIR" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm --enable-shared
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
