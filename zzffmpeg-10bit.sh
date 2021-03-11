#!/bin/bash
# install ffmpeg-10bit
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ffmpeg-10bit"
TYPE=".tar"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/qruf/ffmpeg-10bit/releases/download/20160320/sources_20160320.tar"
echo $NAME will be installed in $ROOTDIR

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
echo $NAME installed on "$ROOTDIR"
