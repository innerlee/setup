# install yasm

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz -O yasm.tar.gz

mkdir -p yasm/src
tar xf yasm.tar.gz -C yasm/src --strip-components 1

cd yasm/src
./configure --prefix=$ROOTDIR/yasm
make -j && make install

cd ..
echo yasm installed on $(pwd)
