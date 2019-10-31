# install cmake

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4.tar.gz -O cmake.tar.gz

mkdir -p src/cmake
tar xf cmake.tar.gz -C src/cmake --strip-components 1

cd src/cmake
./configure --prefix=$ROOTDIR
make -j && make install

echo cmake installed on $ROOTDIR
