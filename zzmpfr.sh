# install mpfr
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="mpfr"
TYPE=".tar.xz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://www.mpfr.org/mpfr-current/mpfr-4.0.2.tar.xz"
echo $NAME will be installed in $ROOTDIR

echo install gmp first

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

./configure --prefix=$ROOTDIR --with-gmp=$ROOTDIR
make -j && make check && make install

make check

echo $NAME installed on $ROOTDIR
