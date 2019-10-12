# install ncurses on ~/app/ncurses

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://mirror-hk.koddos.net/gnu/ncurses/ncurses-6.1.tar.gz -O ncurses.tar.gz

mkdir -p ncurses/src
tar xf ncurses.tar.gz -C ncurses/src --strip-components 1
rm ncurses.tar.gz

cd ncurses/src

export CXXFLAGS=" -fPIC"
export CFLAGS=" -fPIC"

./configure --prefix=$ROOTDIR/ncurses --enable-shared
make -j && make install

echo ncurses installed on $ROOTDIR/ncurses
