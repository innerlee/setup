#!/bin/bash
# install peco
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="peco"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/peco/peco/releases/download/v0.5.7/peco_linux_amd64.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

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
cp peco "$ROOTDIR/bin"

echo $NAME installed on "$ROOTDIR"
