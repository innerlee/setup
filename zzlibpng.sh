#!/bin/bash
# install libpng
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libpng"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://download.sourceforge.net/libpng/libpng-1.6.37.tar.gz"
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

./configure --prefix=$ROOTDIR
make -j && make install

echo $NAME installed on $ROOTDIR
