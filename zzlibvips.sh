#!/bin/bash
# install libvips
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libvips"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/libvips/libvips/releases/download/v8.9.0/vips-8.9.0.tar.gz"
echo $NAME will be installed in "$ROOTDIR"
echo Dependency: libjpeg libexif giflib librsvg libtiff libpng fftw3 lcms2 ImageMagick pangoft2 orc-0.4 libwebp

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

export CFLAGS="-I$ROOTDIR/include"
export CPPFLAGS="-I$ROOTDIR/include"
export LDFLAGS="-L$ROOTDIR/lib"
export PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig:$ROOTDIR/share/pkgconfig:"$PKG_CONFIG_PATH

./configure --prefix="$ROOTDIR"
# make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
echo You may need
echo export GI_TYPELIB_PATH="$ROOTDIR/lib/girepository-1.0"
