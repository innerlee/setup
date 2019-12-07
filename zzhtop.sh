#!/bin/bash
# install htop
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="htop"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: ncurses

mkdir -p $ROOTDIR/downloads
cd $ROOTDIR

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading..."
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

./configure --prefix=$ROOTDIR
make -j && make install

echo $NAME installed on $ROOTDIR
