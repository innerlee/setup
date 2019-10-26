# install cmake

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4.tar.gz -O cmake.tar.gz

mkdir -p cmake/src
tar xf cmake.tar.gz -C cmake/src --strip-components 1

cd cmake/src
./configure --prefix=$ROOTDIR/cmake
make -j && make install

cd ..
echo cmake installed on `pwd`
