# install opencv

ROOTDIR=/mnt/lustrenvme/lizz/app
mkdir -p $ROOTDIR
cd $ROOTDIR

cp /mnt/lustrenew/share/lizz/downloads/opencv-4.1.2.tar.gz opencv.tar.gz
cp /mnt/lustrenew/share/lizz/downloads/opencv_contrib-4.1.2.tar.gz opencvcontrib.tar.gz

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
    -DPYTHON_DEFAULT_EXECUTABLE=$(which python) \
    -DWITH_OPENGL=ON \
    -DFORCE_VTK=OFF \
    -DWITH_TBB=ON \
    -DWITH_GDAL=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DWITH_CUDA=ON \
    -DWITH_NVCUVID=ON \
    -DMKL_WITH_TBB=ON \
    -DMKL_WITH_OPENMP=ON \
    -DWITH_XINE=ON \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DCMAKE_INSTALL_PREFIX=/mnt/lustrenvme/lizz/app/opencv \
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
