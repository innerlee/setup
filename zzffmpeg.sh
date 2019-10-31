# install ffmpeg

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://www.ffmpeg.org/releases/ffmpeg-4.2.1.tar.gz -O ffmpeg.tar.gz

mkdir -p ffmpeg/src
tar xf ffmpeg.tar.gz -C ffmpeg/src --strip-components 1

cd ffmpeg/src
./configure --prefix=$ROOTDIR/ffmpeg
make -j && make install

cd ..
echo ffmpeg installed on $(pwd)
