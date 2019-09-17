# disable anaconda path to begin with
# comment out its section in ~/.bashrc
# and execute in commandline "source ~/.bashrc"
prev_dir="$PWD"
prefix_dir="/usr/local"
#install prerequisite
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential pkg-config
sudo apt-get install liblzma-dev libtbb2 libtbb-dev
sudo apt-get install libjpeg-dev libtiff-dev libjasper-dev libpng-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgtk-3-dev
sudo apt-get install libatlas-base-dev gfortran
#cleanup if possible
opencv_version="4.1.1"
opencv_name="opencv-$opencv_version"
opencv_source_path="./$opencv_name"
opencv_build_path="./$opencv_name/build"
if [ -d $opencv_source_path ]; then
	@echo $opencv_source_path exists
	if [ -d $opencv_build_path ]; then
		@echo $opencv_build_path exists
		cd $opencv_build_path
		sudo make uninstall
		make clean
		cd $prev_dir
	fi
fi
rm -rf $opencv_source_path
#download opencv
opencv_zip="$opencv_name.zip"
if [ ! -f $opencv_zip ]; then
	wget -O $opencv_zip https://github.com/Itseez/opencv/archive/$opencv_version.zip
fi
unzip $opencv_zip
#build opencv 
mkdir -p $opencv_build_path
cd $opencv_build_path
cmake .. -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_SHARED_LIBS=ON -D CMAKE_INSTALL_PREFIX=$prefix_dir \
        -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python2.7 -D BUILD_opencv_python=OFF \
	-D BUILD_opencv_python2=OFF -D INSTALL_C_EXAMPLES=OFF \
	-D WITH_JPEG=ON -D BUILD_JPEG=ON \
	-D WITH_PNG=ON -D BUILD_PNG=ON -D WITH_TIFF=ON -D BUILD_TIFF=ON \
	-D WITH_JASPER=ON -D BUILD_JASPER=ON -D WITH_ZLIB=ON -D BUILD_ZLIB=ON \
        -D BUILD_EXAMPLES=OFF -D WITH_TBB=ON -D BUILD_TBB=ON -D WITH_V4L=ON -D WITH_QT=OFF \
        -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=OFF -D WITH_IPP=ON -D BUILD_IPP_IW=ON \
        -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_OPENCL=OFF -D ENABLE_CXX11=ON ..
make -j$(getconf _NPROCESSORS_ONLN)

sudo make install
sudo ldconfig

#update include folder
if [ "$opencv_version" \< "4.0.0" ]; then
	@echo "opencv verison is less than 4.0.0"
else
	sudo rm -rf $prefix_dir/include/opencv/
	sudo rm -rf $prefix_dir/include/opencv2/
	sudo mv $prefix_dir/include/opencv4/opencv2/ $prefix_dir/include/
	sudo rm -rf $prefix_dir/include/opencv4/
fi

cd $prev_dir
