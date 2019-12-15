#!/bin/bash
# install image magick
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="imagemagick"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://imagemagick.org/download/ImageMagick.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: freetype jpeg png perl libltdl zlib

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

./configure --prefix=$ROOTDIR --with-modules --enable-shared --with-perl
make -j && make install

echo $NAME installed on $ROOTDIR
