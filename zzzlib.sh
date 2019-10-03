# install git on ~/app/git

ROOTDIR=~/app
mkdir -p $ROOTDIR

wget https://zlib.net/zlib-1.2.11.tar.gz -O zlib.tar.gz

mv zlib.tar.gz $ROOTDIR/

cd $ROOTDIR
tar xf zlib.tar.gz
mv zlib-1.2.11 zlib
rm zlib.tar.gz

cd zlib
./configure --prefix=$ROOTDIR/zlib && make && make install

echo zlib installed on $ROOTDIR
