wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar xf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
mkdir -p ~/app/libevent
./configure --prefix="$HOME/app/libevent"
make -j && make install
