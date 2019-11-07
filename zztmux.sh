# install tmux
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="tmux"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz"
echo $NAME will be installed in $ROOTDIR
echo "hey, install libevent first"

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

./configure --prefix=$ROOTDIR CFLAGS="-I$ROOTDIR/include -I$ROOTDIR/include/ncurses" LDFLAGS="-L$ROOTDIR/lib"
make -j && make install

echo $NAME installed on $ROOTDIR
