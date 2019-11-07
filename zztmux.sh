ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

echo "hey, install libevent first"

wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz -O tmux.tar.gz

mkdir -p tmux/src
tar xf tmux.tar.gz -C tmux/src --strip-components 1

cd tmux/src

./configure --prefix=$ROOTDIR/tmux CFLAGS="-I$ROOTDIR/include -I$ROOTDIR/include/ncurses" LDFLAGS="-L$ROOTDIR/lib"
make -j && make install
