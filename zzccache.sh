# install ccache

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://github.com/ccache/ccache/releases/download/v3.7.5/ccache-3.7.5.tar.gz -O ccache.tar.gz

mkdir -p src/ccache
tar xf ccache.tar.gz -C src/ccache --strip-components 1

cd src/ccache

make configure

./configure --prefix=$ROOTDIR
make -j && make install

cd ..
echo ccache installed on $(pwd)
