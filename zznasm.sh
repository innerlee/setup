#!/bin/bash
# install nasm
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="nasm"
TYPE=".tar.xz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz"
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

./autogen.sh
./configure --prefix=$ROOTDIR
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
