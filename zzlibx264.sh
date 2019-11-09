# install libx264
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libx264"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://code.videolan.org/videolan/x264/-/archive/master/x264-master.tar.gz"
echo $NAME will be installed in $ROOTDIR

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

PKG_CONFIG_PATH="$ROOTDIR/lib/pkgconfig"
./configure --prefix=$ROOTDIR --enable-shared
make -j && make install

echo $NAME installed on $ROOTDIR
