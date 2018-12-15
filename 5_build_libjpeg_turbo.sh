rm -rf libjpeg_turbo
#get libjpeg turbo
mkdir libjpeg_turbo
cd libjpeg_turbo
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git .
#install yasm
sudo apt-get install yasm
#build libjpeg turbo
cmake -G"Unix Makefiles"
make -j$(getconf _NPROCESSORS_ONLN)
sudo make install
cd ..
