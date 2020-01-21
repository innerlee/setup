#!/bin/bash
# install libnumactl
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libnumactl"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/numactl/numactl/releases/download/v2.0.13/numactl-2.0.13.tar.gz"
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

#./autogen.sh
./configure --prefix=$ROOTDIR
make -j$(nproc) && make install

echo $NAME installed on $ROOTDIR
