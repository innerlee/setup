# install pigz
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="pigz"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://zlib.net/pigz/pigz-2.4.tar.gz"
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

make -j

echo not finished yet
# echo $NAME installed on $ROOTDIR
