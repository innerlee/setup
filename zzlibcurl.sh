# install libcurl

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://curl.haxx.se/download/curl-7.66.0.tar.gz -O libcurl.tar.gz

mkdir -p libcurl/src
tar xf libcurl.tar.gz -C libcurl/src --strip-components 1

cd libcurl/src

make configure

./configure --prefix=$ROOTDIR/libcurl
make -j && make install

cd ..
echo libcurl installed on `pwd`
