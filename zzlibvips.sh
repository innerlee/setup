#!/bin/bash
# install libvips
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libvips"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/libvips/libvips/releases/download/v8.8.4/vips-8.8.4.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: libjpeg libexif giflib librsvg libtiff libpng fftw3 lcms2 ImageMagick pangoft2 orc-0.4 libwebp

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

export PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig"
./configure --prefix=$ROOTDIR
# make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
echo You may need
echo export GI_TYPELIB_PATH="$ROOTDIR/lib/girepository-1.0"
