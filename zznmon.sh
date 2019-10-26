ROOTDIR=$HOME/app
mkdir -p $ROOTDIR/bin

cd $ROOTDIR
wget http://sourceforge.net/projects/nmon/files/nmon16j.tar.gz -O nmon.tar.gz

mkdir -p nmon/bin
tar xf nmon.tar.gz -C nmon/bin

cd $ROOTDIR/bin
ln -s ../nmon/bin/nmon_x86_rhel75 nmon

echo $(pwd)
