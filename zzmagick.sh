# install image magick

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://imagemagick.org/download/ImageMagick.tar.gz -O magick.tar.gz

mkdir -p magick/src
tar xf magick.tar.gz -C magick/src --strip-components 1

cd magick/src

./configure --prefix=$ROOTDIR/magick

make -j && make install

cd ..
echo magick installed on `pwd`
