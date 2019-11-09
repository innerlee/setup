# install x265
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="x265"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://bitbucket.org/multicoreware/x265/downloads/x265_3.2.1.tar.gz"
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

cd src/$NAME/build/linux

cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$ROOTDIR" -DENABLE_SHARED:bool=on ../../source
make -j && make install

echo $NAME installed on $ROOTDIR
