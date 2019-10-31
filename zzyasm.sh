# install yasm

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz -O yasm.tar.gz

mkdir -p src/yasm
tar xf yasm.tar.gz -C src/yasm --strip-components 1

cd src/yasm
./configure --prefix=$ROOTDIR
make -j && make install

echo yasm installed on $ROOTDIR
