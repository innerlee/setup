# install git

ROOTDIR=/home/lizz/app
mkdir -p $ROOTDIR

ldconfig -p | grep libz
if [ $? != 0 ]; then
   echo "hey, install libz first"
   sh zzlibz.sh
   export CFLAGS="-I$ROOTDIR/libz/include"
   export LDFLAGS="-L$ROOTDIR/libz/lib"
fi

cd $ROOTDIR
wget https://codeload.github.com/git/git/tar.gz/v2.23.0 -O git.tar.gz

mkdir -p git/src
tar xf git.tar.gz -C git/src --strip-components 1

cd git/src

make configure

if [[ -z "${CFLAGS}" ]]; then
    ./configure --prefix=$ROOTDIR/git
else
    ./configure --prefix=$ROOTDIR/git CFLAGS=$CFLAGS LDFLAGS=$LDFLAGS
fi

make -j && make install

cd ..
echo git installed on `pwd`
