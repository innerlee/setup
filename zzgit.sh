#!/bin/bash
# install git
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="git"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/git/git/archive/v2.24.0.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo "hey, install libz and libcurl first, and temporarily remove anaconda from your PATH before install!"

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

make configure
./configure --prefix=$ROOTDIR
make -j && make install

echo $NAME installed on $ROOTDIR

# install git
ROOTDIR=${ZZROOT:-$HOME/app}
mkdir -p $ROOTDIR
cd $ROOTDIR



# ./configure --prefix=$ROOTDIR CFLAGS="-I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libcurl/lib"
# ./configure --prefix=$ROOTDIR CFLAGS="-I$ROOTDIR/libz/include -I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libz/lib -L$ROOTDIR/libcurl/lib"
