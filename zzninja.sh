#!/bin/bash
# install ninja
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ninja"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/ninja-build/ninja/archive/v1.9.0.tar.gz"
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

./configure.py --bootstrap
cp ninja $ROOTDIR/bin

echo $NAME installed on $ROOTDIR
