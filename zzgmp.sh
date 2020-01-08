#!/bin/bash
# install gmp
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="gmp"
TYPE=".tar.xz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz"
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
make -j$(nproc) && make check && make install

echo $NAME installed on $ROOTDIR
