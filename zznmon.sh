#!/bin/bash
# install nmon
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="nmon"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://sourceforge.net/projects/nmon/files/nmon16j.tar.gz"
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
tar xf downloads/$FILE -C src/$NAME

cd bin
ln -s ../src/nmon/nmon_x86_rhel75 nmon -f

echo $NAME installed on $ROOTDIR
