ROOTDIR=/home/lizz/app

# ldconfig -p | grep libevent
# if [ $? != 0 ]; then
#    echo "hey, install libevent first"
#    sh zzlibevent.sh
# fi

cd $ROOTDIR
wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz -O tmux.tar.gz

mkdir -p tmux/src
tar xf tmux.tar.gz -C tmux/src --strip-components 1

cd tmux/src

./configure --prefix=$ROOTDIR/tmux CFLAGS="-I$ROOTDIR/libevent/include -I$ROOTDIR/ncurses/include -I$ROOTDIR/ncurses/include/ncurses" LDFLAGS="-L$ROOTDIR/libevent/lib -L$ROOTDIR/ncurses/lib"

make -j && make install
