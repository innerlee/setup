ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz -O htop.tar.gz

mkdir -p htop/src
tar xf htop.tar.gz -C htop/src --strip-components 1

cd htop/src

./configure --prefix=$ROOTDIR/htop CFLAGS="-I$ROOTDIR/ncurses/include -I$ROOTDIR/ncurses/include/ncurses" LDFLAGS="-L$ROOTDIR/ncurses/lib" --disable-unicode

make -j && make install
