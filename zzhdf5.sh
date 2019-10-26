# install hdf5

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://s3.amazonaws.com/hdf-wordpress-1/wp-content/uploads/manual/HDF5/HDF5_1_10_5/source/hdf5-1.10.5.tar.gz -O hdf5.tar.gz

mkdir -p hdf5/src
tar xf hdf5.tar.gz -C hdf5/src --strip-components 1

cd hdf5/src
./configure --prefix=$ROOTDIR/hdf5
make -j && make install

cd ..
echo hdf5 installed on $(pwd)
