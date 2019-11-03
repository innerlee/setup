# install git
ROOTDIR=${ZZROOT:-$HOME/app}
mkdir -p $ROOTDIR
cd $ROOTDIR

echo "hey, install libz and libcurl first"

wget https://codeload.github.com/git/git/tar.gz/v2.23.0 -O git.tar.gz

mkdir -p src/git
tar xf git.tar.gz -C src/git --strip-components 1

cd src/git

make configure

# ./configure --prefix=$ROOTDIR CFLAGS="-I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libcurl/lib"
# ./configure --prefix=$ROOTDIR CFLAGS="-I$ROOTDIR/libz/include -I$ROOTDIR/libcurl/include -I$ROOTDIR/libcurl/include/curl" LDFLAGS="-L$ROOTDIR/libz/lib -L$ROOTDIR/libcurl/lib"
./configure --prefix=$ROOTDIR
make -j && make install

echo git installed on $ROOTDIR
