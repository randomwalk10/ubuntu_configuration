#workon py2
workon py2
#install prerequisite
sudo apt-get install pkg-config
sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgtk-3-dev
sudo apt-get install libatlas-base-dev gfortran
#cleanup if possible
opencv_source_path="./opencv-3.3.0"
opencv_build_path="./opencv-3.3.0/build"
if [ -d "$opencv_source_path" ]; then
	echo "$opencv_source_path exists"
	if [ -d "$opencv_build_path" ]; then
		echo "$opencv_build_path exists"
		cd $opencv_build_path
		sudo make uninstall
		make clean
		cd ../..
	fi
fi
rm -rf opencv-3.3.0
#download opencv 3.3
if [ ! -f "./opencv-3.3.0.zip" ]; then
	wget -O opencv-3.3.0.zip https://github.com/Itseez/opencv/archive/3.3.0.zip
fi
unzip opencv-3.3.0.zip
#build opencv 
cd ./opencv-3.3.0/
mkdir build
cd build
cmake .. -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/py2/bin/python \
        -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=ON \
        -D BUILD_EXAMPLES=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=OFF \
        -D BUILD_PERF_TESTS=ON -D BUILD_TESTS=ON -D WITH_IPP=ON \
        -D WITH_JPEG=ON -D BUILD_JPEG=OFF -D JPEG_INCLUDE_DIR=/opt/libjpeg-turbo/include \
        -D JPEG_LIBRARY=/opt/libjpeg-turbo/lib64/libjpeg.a \
        -D WITH_CUDA=ON -D WITH_CUBLAS=ON -D CUDA_FAST_MATH=ON \
        -D CUDA_ARCH_BIN=61 \
        -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES" \
        -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_OPENCL=OFF -D ENABLE_CXX11=ON ..
make -j$(getconf _NPROCESSORS_ONLN)

sudo make install

sudo ldconfig

prev_dir="$PWD"
cd ~/.virtualenvs/py2/lib/python2.7/site-packages/
if [ ! -f "cv2.so" ]; then
	echo "cv2.so does not exists. Now link it"
else
	echo "cv2.so exists. Now re-link it"
	rm -f cv2.so
fi
ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
cd "$prev_dir"
