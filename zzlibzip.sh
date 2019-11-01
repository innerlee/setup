# install libzip

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://libzip.org/download/libzip-1.5.2.tar.gz -O libzip.tar.gz

mkdir -p src/libzip
tar xf libzip.tar.gz -C src/libzip --strip-components 1

cd src/libzip
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$ROOTDIR ..
./configure --prefix=$ROOTDIR
make -j && make install

echo libzip installed on $ROOTDIR
