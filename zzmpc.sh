# install mpc
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="mpc"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="http://fs.paratools.com/mpc/MPC_3.3.1.tar.gz"
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
tar xfz downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

./installmpc --prefix=$ROOTDIR

echo $NAME installed on $ROOTDIR
