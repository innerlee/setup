#!/bin/bash
# install libopenjp2
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libopenjp2"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/uclouvain/openjpeg/archive/v2.3.1.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: nasm, yasm

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

mkdir -p build
cd build

cmake -E env LDFLAGS="-L/$ZZROOT/lib -lz" cmake -DCMAKE_INSTALL_PREFIX=$ROOTDIR -DCMAKE_C_FLAGS="-O3 -march=native -DNDEBUG" ..
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
