#!/bin/bash
# install powershell
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="powershell"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/PowerShell/PowerShell/releases/download/v7.0.0/powershell-7.0.0-linux-x64.tar.gz"
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

mkdir -p bin/$NAME
tar xf downloads/$FILE -C bin/$NAME --strip-components 1

cd bin/

ln -s $NAME/pwsh .

echo $NAME installed on "$ROOTDIR"
