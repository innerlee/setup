# install libcurl

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://curl.haxx.se/download/curl-7.66.0.tar.gz -O libcurl.tar.gz

mkdir -p src/libcurl
tar xf libcurl.tar.gz -C src/libcurl --strip-components 1

cd src/libcurl

make configure

./configure --with-ssl --prefix=$ROOTDIR
make -j && make install

cd ..
echo libcurl installed on $(pwd)
