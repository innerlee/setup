#!/bin/bash
# install libzstd
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libzstd"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/facebook/zstd/releases/download/v1.4.4/zstd-1.4.4.tar.gz"
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

cd src/$NAME/build/cmake/

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$ROOTDIR ..
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
