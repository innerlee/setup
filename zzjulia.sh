#!/bin/bash
# install julia
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="julia"
VERSION="1.5.3"
TYPE=".tar.gz"
FILE="$NAME-$VERSION$TYPE"
DOWNLOADURL="https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-${VERSION}-linux-x86_64.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
mkdir -p "$ROOTDIR"/bin
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p $NAME
tar xf downloads/$FILE -C $NAME --strip-components 1

cd bin
ln -s ../$NAME/bin/julia julia -f

echo $NAME installed on "$ROOTDIR"
