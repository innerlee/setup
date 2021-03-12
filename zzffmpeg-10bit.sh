#!/bin/bash
# install ffmpeg-10bit
set -e

cmake --version
ROOTDIR=${ZZROOT:-$HOME/app}
NAME="ffmpeg-10bit"
TYPE=".tar"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/qruf/ffmpeg-10bit/releases/download/20160320/sources_20160320.tar"
echo $NAME will be installed in $ROOTDIR

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME
cd src/$NAME
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
wget https://www.zlib.net/fossils/zlib-1.2.9.tar.gz
wget https://mirrors.tuna.tsinghua.edu.cn/apache//ant/binaries/apache-ant-1.9.15-bin.tar.gz
ls *.tar* | xargs -P 2 -i tar xf {}

export CFLAGS="-I$ROOTDIR/include"
export CPPFLAGS="-I$ROOTDIR/include"
export LDFLAGS="-L$ROOTDIR/lib -L$ROOTDIR/lib64"
export PKG_CONFIG_PATH=$ROOTDIR/lib/pkgconfig:$ROOTDIR/lib64/pkgconfig:$ROOTDIR/share/pkgconfig:$PKG_CONFIG_PATH
export PATH=$ROOTDIR/bin:$ROOTDIR/src/ffmpeg-10bit/apache-ant-1.9.15/bin/:$PATH
export LD_LIBRARY_PATH=$ROOTDIR/lib:$ROOTDIR/lib64:$LD_LIBRARY_PATH
cd $ROOTDIR/src/$NAME

# install bzip
echo -e "\033[32m[-23] >>> install bzip... \033[0m"
cd bzip2-1.0.6/
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -f Makefile-libbz2_so > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install PREFIX=$ROOTDIR > log_make_install.txt 2>&1
cd ../

# install xz
echo -e "\033[32m[-22] >>> install xz... \033[0m"
cd xz-5.2.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libxml
echo -e "\033[32m[-21] >>> install libxml... \033[0m"
cd libxml2-2.9.3
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR --without-python > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libogg
echo -e "\033[32m[-20] >>> install libogg... \033[0m"
cd libogg-1.3.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install zimg
echo -e "\033[32m[-19] >>> install zimg... \033[0m"
cd zimg-master
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
bash autogen.sh > log_autogen.txt 2>&1
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install zlib
echo -e "\033[32m[-18] >>> install zlib... \033[0m"
cd zlib-1.2.9
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install harfbuzz
echo -e "\033[32m[-17] >>> install harfbuzz... \033[0m"
cd harfbuzz-1.2.3
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install fribidi
echo -e "\033[32m[-16] >>> install fribidi... \033[0m"
cd fribidi-0.19.7
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libbluray
# note: need ant、java
echo -e "\033[32m[-15] >>> install libbluray... \033[0m"
cd libbluray-0.9.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install gmp
echo -e "\033[32m[-14] >>> install gmp... \033[0m"
cd gmp-6.1.0
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
echo "      >>> make check...    [log > "$SHELL_FOLDER/log_make_check.txt ]
make check > log_make_check.txt 2>&1
cd ../

# install nettle
echo -e "\033[32m[-13] >>> install nettle... \033[0m"
cd nettle-2.7.1
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install gnutls
echo -e "\033[32m[-12] >>> install gnutls... \033[0m"
cd gnutls-3.3.22
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR --disable-doc --disable-tests > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install opus
echo -e "\033[32m[-11] >>> install opus... \033[0m"
cd opus-1.1.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libvorbis
echo -e "\033[32m[-10] >>> install libvorbis... \033[0m"
cd libvorbis-1.3.5
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install yasm
echo -e "\033[32m[-09] >>> install yasm... \033[0m"
cd yasm-1.3.0
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libvpx
echo -e "\033[32m[-08] >>> install libvpx... \033[0m"
cd libvpx-master
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libass
echo -e "\033[32m[-07] >>> install libass... \033[0m"
cd libass-0.13.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install libiconv
echo -e "\033[32m[-06] >>> install libiconv... \033[0m"
cd libiconv-1.14
sed -i '698i\\/\*' srclib/stdio.in.h
sed -i '699a\\*\/' srclib/stdio.in.h
sed -i '700a\\#if\ defined\(__GLIBC__\)\ \&\&\ \!defined\(__UCLIBC__\)\ \&\&\ \!__GLIBC_PREREQ\(2,\ 16\)' srclib/stdio.in.h
sed -i '701a\\ _GL_WARN_ON_USE\ \(gets,\ \"gets\ is\ a\ security\ hole\ \-\ use\ fgets\ instead\"\)\;' srclib/stdio.in.h
sed -i '702a\\#endif' srclib/stdio.in.h
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install lame
echo -e "\033[32m[-05] >>> install lame... \033[0m"
cd lame-3.99.5
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install freetype
echo -e "\033[32m[-04] >>> install freetype... \033[0m"
cd freetype-2.6.2
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install fontconfig
echo -e "\033[32m[-03] >>> install fontconfig... \033[0m"
cd fontconfig-2.11.1
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install x264
echo -e "\033[32m[-02] >>> install x264... \033[0m"
cd x264-snapshot-20160319-2245-stable
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure --prefix=$ROOTDIR --enable-shared --enable-static --bit-depth=10 > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1
cd ../

# install x265
echo -e "\033[32m[-01] >>> install x265... \033[0m"
cd multicoreware-x265-20f14d78dbad/build
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> cmake...         [log > "$SHELL_FOLDER/log_cmake.txt ]
cmake ../source/ > log_cmake.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install DESTDIR=$ROOTDIR > log_make_install.txt 2>&1
mv $ROOTDIR/usr/local/lib/libx265.a $ROOTDIR/lib/
mv $ROOTDIR/usr/local/lib/libx265.so $ROOTDIR/lib/
mv $ROOTDIR/usr/local/lib/libx265.so.79 $ROOTDIR/lib/
sed -i '1d' $ROOTDIR/usr/local/lib/pkgconfig/x265.pc
echo prefix=$ROOTDIR > tmptmp
cat tmptmp $ROOTDIR/usr/local/lib/pkgconfig/x265.pc > $ROOTDIR/lib/pkgconfig/x265.pc
rm $ROOTDIR/usr/local/lib/pkgconfig/x265.pc
rm tmptmp
mv $ROOTDIR/usr/local/bin/x265 $ROOTDIR/bin/
mv $ROOTDIR/usr/local/include/* $ROOTDIR/include/
cd ../../

# install ffmpeg
echo -e "\033[32m[000] >>> install ffmpeg... \033[0m"
cd ffmpeg
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
echo "      >>> configure...     [log > "$SHELL_FOLDER/log_configure.txt ]
./configure  --prefix=$ROOTDIR --disable-doc --disable-debug --enable-avisynth --enable-dxva2 --enable-bzlib --enable-fontconfig --enable-gmp --enable-gnutls --enable-iconv --enable-libass --enable-libbluray --enable-libfreetype --enable-libfribidi --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libzimg --enable-lzma --enable-zlib --enable-gpl --enable-version3 --enable-nonfree --arch=x86_64  > log_configure.txt 2>&1
echo "      >>> make...          [log > "$SHELL_FOLDER/log_make.txt ]
make -j 4 > log_make.txt 2>&1
echo "      >>> make install...  [log > "$SHELL_FOLDER/log_make_install.txt ]
make install > log_make_install.txt 2>&1

echo "======================================================"
echo $NAME installed on "$ROOTDIR"

# ./ffmpeg -threads 2 -guess_layout_max 0 -r 50 -i "/data2/git-projects/mmediting/hd2ximg/%7d.png" -r 50 -c:v libx264  -deinterlace -profile:v high422 -pix_fmt yuv422p10le -x264-params "nal-hrd=cbr:force-crf=1" -b:v 500M -minrate 500M -maxrate 500M  -bufsize 1000M -level 5.2 -refs 0 -x264opts no-cabac -g 1 "/data2/output.mxf"