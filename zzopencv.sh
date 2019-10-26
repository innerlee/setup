# install opencv

ROOTDIR=$HOME/app
mkdir -p $ROOTDIR
cd $ROOTDIR

wget https://github.com/opencv/opencv/archive/4.1.2.tar.gz -O opencv.tar.gz
wget https://github.com/opencv/opencv_contrib/archive/4.1.2.tar.gz -O opencvcontrib.tar.gz

mkdir -p opencv/src/opencv_contrib
tar xf opencv.tar.gz -C opencv/src --strip-components 1
tar xf opencvcontrib.tar.gz -C opencv/src/opencv_contrib --strip-components 1

cd opencv/src
mkdir build
cd build

cmake \
    -DWITH_QT=OFF \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_opencv_hdf=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_opencv_cnn_3dobj=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_dnn_modern=OFF \
    -DBUILD_opencv_dnns_easily_fooled=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_opencv_python2=OFF \
    -DBUILD_NEW_PYTHON_SUPPORT=ON \
    -DBUILD_opencv_python3=ON \
    -DHAVE_opencv_python3=ON \
    -DPYTHON_DEFAULT_EXECUTABLE=$(which python) \
    -DWITH_OPENGL=ON \
    -DFORCE_VTK=OFF \
    -DWITH_TBB=ON \
    -DWITH_GDAL=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DWITH_CUDA=ON \
    -DMKL_WITH_TBB=ON \
    -DMKL_WITH_OPENMP=ON \
    -DWITH_XINE=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DCMAKE_INSTALL_PREFIX=/mnt/lustrenew/lizz/app/opencv \
    -DPYTHON_EXECUTABLE="$HOME/anaconda3/bin/python" \
    -DPYTHON_LIBRARY="$HOME/anaconda3/lib/python3.7" \
    -DPYTHON3_LIBRARY="$HOME/anaconda3/lib/python3.7" \
    -DPYTHON3_EXECUTABLE="$HOME/anaconda3/bin/python" \
    -DPYTHON3_INCLUDE_DIR="$HOME/anaconda3/include/python3.7m" \
    -DPYTHON3_INCLUDE_DIR2="$HOME/anaconda3/include" \
    -DPYTHON3_NUMPY_INCLUDE_DIRS="$HOME/anaconda3/lib/python3.7/site-packages/numpy/core/include" \
    -DPYTHON3_INCLUDE_PATH="$HOME/anaconda3/include/python3.7m" \
    -DPYTHON3_LIBRARIES="$HOME/anaconda3/lib/libpython3.7m.so" \
    -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ..

make -j && make install

cd ../..
echo opencv installed on $(pwd)
