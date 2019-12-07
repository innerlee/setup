#!/bin/bash
# Installs Zsh
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="zsh"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/zsh-users/zsh/archive/zsh-5.7.1.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo install ncurses first!

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

export CFLAGS=' -fPIC'
export CXXFLAGS=' -fPIC'
# export CFLAGS=-I$ROOTDIR/include
# export CPPFLAGS="-I$ROOTDIR/include" LDFLAGS="-L$ROOTDIR/lib"

autoheader
autoconf
./configure --prefix=$ROOTDIR --enable-shared
make -j && make install

echo $NAME installed on $ROOTDIR
echo put this in .bashrc
echo exec $ROOTDIR/bin/zsh -l
