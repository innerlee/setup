#!/bin/bash
# install perl
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="perl"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.cpan.org/src/5.0/perl-5.30.1.tar.gz"
echo $NAME will be installed in $ROOTDIR

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

./Configure -des -Dprefix=$ROOTDIR -Dusethreads
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
