#!/bin/bash
# install opencv
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME1="opencv"
NAME2="opencv_contrib"
TYPE=".tar.gz"
FILE1="$NAME1$TYPE"
FILE2="$NAME2$TYPE"
DOWNLOADURL1="https://github.com/opencv/opencv/archive/4.3.0.tar.gz"
DOWNLOADURL2="https://github.com/opencv/opencv_contrib/archive/4.3.0.tar.gz"
echo $NAME1 will be installed in "$ROOTDIR"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE1" ]; then
    echo "downloads/$FILE1 exist"
else
    echo "$FILE1 does not exist, downloading from $DOWNLOADURL1"
    wget $DOWNLOADURL1 -O $FILE1
    mv $FILE1 downloads/
fi

if [ -f "downloads/$FILE2" ]; then
    echo "downloads/$FILE2 exist"
else
    echo "$FILE2 does not exist, downloading from $DOWNLOADURL2"
    wget $DOWNLOADURL2 -O $FILE2
    mv $FILE2 downloads/
fi

mkdir -p src/$NAME1
mkdir -p src/$NAME2
tar xf downloads/$FILE1 -C src/$NAME1 --strip-components 1
tar xf downloads/$FILE2 -C src/$NAME2 --strip-components 1

cd src/$NAME1
mkdir -p build
cd build

export PKG_CONFIG_PATH="$ROOTDIR"/lib/pkgconfig:$PKG_CONFIG_PATH

cmake \
    -DBUILD_EXAMPLES=OFF \
    -DWITH_QT=OFF \
    -DCUDA_GENERATION=Auto \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_opencv_hdf=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_opencv_cnn_3dobj=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_datasets=OFF \
    -DBUILD_opencv_aruco=OFF \
    -DBUILD_opencv_tracking=OFF \
    -DBUILD_opencv_text=OFF \
    -DBUILD_opencv_stereo=OFF \
    -DBUILD_opencv_saliency=OFF \
    -DBUILD_opencv_rgbd=OFF \
    -DBUILD_opencv_reg=OFF \
    -DBUILD_opencv_ovis=OFF \
    -DBUILD_opencv_matlab=OFF \
    -DBUILD_opencv_freetype=OFF \
    -DBUILD_opencv_dpm=OFF \
    -DBUILD_opencv_face=OFF \
    -DBUILD_opencv_dnn_superres=OFF \
    -DBUILD_opencv_dnn_objdetect=OFF \
    -DBUILD_opencv_bgsegm=OFF \
    -DBUILD_opencv_cvv=OFF \
    -DBUILD_opencv_ccalib=OFF \
    -DBUILD_opencv_bioinspired=OFF \
    -DBUILD_opencv_dnn_modern=OFF \
    -DBUILD_opencv_dnns_easily_fooled=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_NEW_PYTHON_SUPPORT=ON \
    -DBUILD_opencv_python3=OFF \
    -DHAVE_opencv_python3=OFF \
    -DPYTHON_DEFAULT_EXECUTABLE="$(which python)" \
    -DWITH_OPENGL=ON \
    -DWITH_VTK=OFF \
    -DFORCE_VTK=OFF \
    -DWITH_TBB=ON \
    -DWITH_GDAL=ON \
    -DCUDA_FAST_MATH=ON \
    -DWITH_CUBLAS=ON \
    -DWITH_MKL=ON \
    -DMKL_USE_MULTITHREAD=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DWITH_CUDA=ON \
    -DNVCC_FLAGS_EXTRA="--default-stream per-thread" \
    -DWITH_NVCUVID=OFF \
    -DBUILD_opencv_cudacodec=OFF \
    -DMKL_WITH_TBB=ON \
    -DWITH_FFMPEG=ON \
    -DMKL_WITH_OPENMP=ON \
    -DWITH_XINE=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DCMAKE_INSTALL_PREFIX="$ROOTDIR" \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    ..

make -j"$(nproc)" && make install

echo "$NAME1" installed on "$ROOTDIR"
echo add following line to .zshrc
echo export OpenCV_DIR="$ROOTDIR"
