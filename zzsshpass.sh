#!/bin/bash
# install sshpass
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="sshpass"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/innerlee/sshpass/archive/master.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo Dependency: oathtool, autoconf

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

autoreconf -f -i
./configure --prefix=$ROOTDIR
make -j && make install

echo $NAME installed on $ROOTDIR
echo Usage:
echo export SSHVCODE=YOUR_GOOGLE_AUTHE_SECRET
echo export SSHPASS=YOUR_SSH_PASSWORD
echo sshpass -e ssh user@host
