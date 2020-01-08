#!/bin/bash
# install libjpeg
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libjpeg"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://www.ijg.org/files/jpegsrc.v6b.tar.gz"
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

ln -s `which libtool` libtool
./configure --enable-shared --prefix=$ROOTDIR
make -j$(nproc) && make install-lib

echo $NAME installed on $ROOTDIR
