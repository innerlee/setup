# install ffmpeg

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://www.ffmpeg.org/releases/ffmpeg-4.2.1.tar.gz -O ffmpeg.tar.gz

mkdir -p src/ffmpeg
tar xf ffmpeg.tar.gz -C src/ffmpeg --strip-components 1

cd src/ffmpeg
./configure --prefix=$ROOTDIR
make -j && make install


cd ..
echo ffmpeg installed on $(pwd)
