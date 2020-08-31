#!/bin/bash
# install pango
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="pango"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://ftp.gnome.org/pub/GNOME/sources/pango/1.44/pango-1.44.7.tar.xz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: libffi,

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

mkdir -p build
cd build
meson --prefix=$ROOTDIR ..
ninja && ninja install
# make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
