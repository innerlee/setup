# install boost

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz -O boost.tar.gz

mkdir -p src/boost
tar xf boost.tar.gz -C src/boost --strip-components 1

cd src/boost
./bootstrap.sh --prefix=$ROOTDIR/boost
./b2 install

echo boost installed on $ROOTDIR/boost
