#!/bin/bash
# install unrar
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="unrar"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.rarlab.com/rar/unrarsrc-5.8.4.tar.gz"
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

make -f makefile
install -v -m755 unrar $ROOTDIR/bin

echo $NAME installed on $ROOTDIR
