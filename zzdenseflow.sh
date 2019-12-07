#!/bin/bash
# install ccache
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ccache"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/ccache/ccache/releases/download/v3.7.5/ccache-3.7.5.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: boost, opencv

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

./configure --prefix=$ROOTDIR
make -j && make install

echo $NAME installed on $ROOTDIR
