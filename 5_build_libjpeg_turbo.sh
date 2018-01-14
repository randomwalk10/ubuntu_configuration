rm -rf libjpeg_turbo
#install prerequisite
sudo apt install autoconf
#get libjpeg turbo
mkdir libjpeg_turbo
cd libjpeg_turbo
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git .
#set compilation flags
export CFLAGS="-fPIC -O4"
export CXXFLAGS="-fPIC -O4"
#install yasm
sudo apt-get install yasm
#build libjpeg turbo
autoreconf -fiv
rm -rf build
mkdir build
cd build
../configure --enable-static \
	--disable-shared \
	--with-simd
make -j$(getconf _NPROCESSORS_ONLN)
sudo make install
cd ../..
