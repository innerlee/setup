#!/bin/bash
# install mpfr
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="mpfr"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.2.tar.gz"
echo $NAME will be installed in $ROOTDIR

echo install gmp first

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

./configure --prefix=$ROOTDIR --with-gmp=$ROOTDIR
make -j$(nproc) && make check && make install

make check

echo $NAME installed on $ROOTDIR
