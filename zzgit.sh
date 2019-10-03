# install git on /home/lizz/app/git

ROOTDIR=/home/lizz/app
mkdir -p $ROOTDIR

wget https://codeload.github.com/git/git/tar.gz/v2.23.0 -O git.tar.gz

mv git.tar.gz $ROOTDIR/

cd $ROOTDIR
tar xf git.tar.gz
mv git-2.23.0 git
rm git.tar.gz

cd git

export C_INCLUDE_PATH=/home/lizz/app/zlib/include
export LD_LIBRARY_PATH=/home/lizz/app/zlib/lib
export LIBRARY_PATH=/home/lizz/app/zlib/lib
# :$LD_LIBRARY_PATH

make configure
./configure --prefix=$ROOTDIR/git && make && make install

cd bin
echo git installed on `pwd`
echo export PATH=`pwd`:\$PATH
