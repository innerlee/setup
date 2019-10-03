# install ncurses on ~/app/ncurses

ROOTDIR=~/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz -O ncurses.tar.gz

mkdir -p ncurses/src
tar xf ncurses.tar.gz -C ncurses/src --strip-components 1
rm ncurses.tar.gz

cd ncurses/src

export CXXFLAGS=" -fPIC"
export CFLAGS=" -fPIC"

./configure --prefix=$ROOTDIR/ncurses --enable-shared && make -j && make install

echo ncurses installed on $ROOTDIR/ncurses
