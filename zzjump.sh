# install autojump
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="autojump"
GITURL="git://github.com/wting/autojump.git"
echo $NAME will be installed in $ROOTDIR

mkdir -p $ROOTDIR/downloads
cd $ROOTDIR

mkdir -p src
cd src

git clone $GITURL $NAME
cd $NAME

./install.py
echo $NAME installed
