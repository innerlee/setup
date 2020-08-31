#!/bin/bash
# install denseflow
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="denseflow"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://codeload.github.com/open-mmlab/denseflow/tar.gz/master"
echo $NAME will be installed in "$ROOTDIR"
echo Dependency: boost, opencv

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

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

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX="$ROOTDIR" ..
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
