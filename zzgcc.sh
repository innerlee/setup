# install gcc
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="gcc"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.4.0/gcc-7.4.0.tar.gz"
echo $NAME will be installed in $ROOTDIR

echo CUDA 10 support up to gcc 7, CUDA 9 support up to gcc 5.
echo Building GCC requires GMP 4.2+, MPFR 2.4.0+ and MPC 0.8.0+.

mkdir -p $ROOTDIR/downloads
cd $ROOTDIR

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading..."
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

./configure --prefix=$ROOTDIR --with-gmp=$ROOTDIR --with-mpfr=$ROOTDIR --with-mpc=$ROOTDIR --enable-languages=c,c++,fortran --disable-multilib
make -j && make install

echo $NAME installed on $ROOTDIR
