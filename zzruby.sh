#!/bin/bash
# install ruby
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ruby"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0.tar.gz"
echo $NAME will be installed in "$ROOTDIR"
echo Dependency: openssl
# libreadline, libyaml, libxml, libssl, zlib1g

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

if [ -d "$ZZROOT/ssl" ]; then
    export SSL_FLAG="--with-openssl-dir=$ZZROOT/ssl"
else
    export SSL_FLAG=""
fi

./configure --prefix="$ROOTDIR" $SSL_FLAG --disable-install-doc
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
