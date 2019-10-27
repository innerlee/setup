# install perl

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://www.cpan.org/src/5.0/perl-5.30.0.tar.gz -O perl.tar.gz

mkdir -p perl/src
tar xf perl.tar.gz -C perl/src --strip-components 1

cd perl/src
./Configure -des -Dprefix=$ROOTDIR/perl
make -j && make install

cd ..
echo perl installed on $(pwd)
