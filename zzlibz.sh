# install libz

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://www.zlib.net/zlib-1.2.11.tar.gz -O libz.tar.gz

mkdir -p libz/src
tar xf libz.tar.gz -C libz/src --strip-components 1

cd libz/src
./configure --prefix=$ROOTDIR/libz
make -j && make install

cd ..
echo libz installed on `pwd`
