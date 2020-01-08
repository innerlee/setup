#!/bin/bash
# install bmon
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="bmon"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/tgraf/bmon/releases/download/v4.0/bmon-4.0.tar.gz"
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

export CFLAGS=-I$ROOTDIR/include
export CPPFLAGS="-I$ROOTDIR/include -I$ROOTDIR/include/ncursesw" LDFLAGS="-L$ROOTDIR/lib"

./configure --prefix=$ROOTDIR
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
