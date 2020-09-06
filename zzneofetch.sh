#!/bin/bash
# install neofetch
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="neofetch"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://codeload.github.com/dylanaraps/neofetch/tar.gz/master"
echo $NAME will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget --no-check-certificate $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

cp neofetch $ROOTDIR/bin

echo $NAME installed on "$ROOTDIR"
