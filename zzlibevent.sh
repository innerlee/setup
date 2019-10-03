ROOTDIR=/home/lizz/app
cd $ROOTDIR

wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz -O libevent.tar.gz

mkdir -p libevent/src
tar xf libevent.tar.gz -C libevent/src --strip-components 1

cd libevent/src
./configure --prefix="$ROOTDIR/libevent"
make -j && make install
