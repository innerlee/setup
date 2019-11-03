# install boost
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="boost"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz"
echo $NAME will be installed in $ROOTDIR


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
./bootstrap.sh --prefix=$ROOTDIR
./b2 install

echo $NAME installed on $ROOTDIR
