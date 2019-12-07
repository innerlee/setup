#!/bin/bash
# install openssl
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="openssl"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.openssl.org/source/openssl-1.1.1d.tar.gz"
echo $NAME will be installed in $ROOTDIR

mkdir -p $ROOTDIR/downloads
cd $ROOTDIR

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading..."
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

./config --prefix=$ROOTDIR --openssldir=$ROOTDIR/ssl
make -j && make install

echo $NAME installed on $ROOTDIR, with --openssldir=$ROOTDIR/ssl
