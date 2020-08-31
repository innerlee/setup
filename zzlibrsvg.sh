#!/bin/bash
# install librsvg
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="librsvg"
TYPE=".tar.xz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://ftp.gnome.org/pub/gnome/sources/librsvg/2.46/librsvg-2.46.4.tar.xz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: rust, cariro, cairo-png, cairo-gobject, freetype2, gdk-pixbuf-2.0, libxml, pangocairo, pangoft2, libcroco

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

export CFLAGS="-I$ROOTDIR/include"
export CPPFLAGS="-I$ROOTDIR/include"
export LDFLAGS="-L$ROOTDIR/lib"
export PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig":"$ROOTDIR/share/pkgconfig":$PKG_CONFIG_PATH

./configure --prefix=$ROOTDIR
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
