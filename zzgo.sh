#!/bin/bash
# install go
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="go"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz"
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
tar xf downloads/$FILE -C $ROOTDIR/

echo $NAME installed on "$ROOTDIR", please add this line to your .zshrc or .bashrc
echo "export PATH=\$PATH:$ROOTDIR/go/bin:$HOME/go/bin"
