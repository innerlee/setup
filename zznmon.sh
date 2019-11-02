ROOTDIR=$HOME/app
mkdir -p $ROOTDIR/bin

cd $ROOTDIR
wget http://sourceforge.net/projects/nmon/files/nmon16j.tar.gz -O nmon.tar.gz

mkdir -p src/nmon
tar xf nmon.tar.gz -C src/nmon

cd $ROOTDIR/bin
ln -s ../src/nmon/nmon_x86_rhel75 nmon

echo $(pwd)
