prev_dir="$PWD"
source_path="./libjpeg_turbo"
# remove
if [ -d $source_path ]; then
	@echo $source_path exists
	cd $source_path
	sudo make uninstall
	make clean
	cd $prev_dir
fi
rm -rf $source_path
#get libjpeg turbo
mkdir $source_path
cd $source_path
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git .
#install yasm
sudo apt-get install yasm
#build libjpeg turbo
cmake -G"Unix Makefiles"
make -j$(getconf _NPROCESSORS_ONLN)
sudo make install
sudo ldconfig
cd $prev_dir
