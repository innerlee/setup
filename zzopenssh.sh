# install openssh

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1d.tar.gz -O openssh.tar.gz

mkdir -p src/openssh
tar xf openssh.tar.gz -C src/openssh --strip-components 1

cd src/openssh

./config --prefix=$ROOTDIR
make -j && make install

cd ..
echo openssh installed on $(pwd)
