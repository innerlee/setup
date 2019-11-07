# install ncurses on ~/app/ncurses
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ncurses"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://mirror-hk.koddos.net/gnu/ncurses/ncurses-6.1.tar.gz"
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

export CXXFLAGS=" -fPIC"
export CFLAGS=" -fPIC"

./configure --prefix=$ROOTDIR --enable-shared
make -j && make install

echo $NAME installed on $ROOTDIR
