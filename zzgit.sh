# install git

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

echo "hey, install libz and libcurl first"

wget https://codeload.github.com/git/git/tar.gz/v2.23.0 -O git.tar.gz

mkdir -p git/src
tar xf git.tar.gz -C git/src --strip-components 1

cd git/src

make configure

# ./configure --prefix=$ROOTDIR/git
# ./configure --prefix=$ROOTDIR/git CFLAGS="-I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libcurl/lib"
./configure --prefix=$ROOTDIR/git CFLAGS="-I$ROOTDIR/libz/include -I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libz/lib -L$ROOTDIR/libcurl/lib"
make -j && make install

cd ..
echo git installed on `pwd`
