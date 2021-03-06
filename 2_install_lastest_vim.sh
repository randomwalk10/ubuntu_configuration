#install prerequisite
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev
#remove existing vim
sudo apt remove vim vim-runtime gvim
#get source and configure
cd ~
if [ ! -d "vim" ]; then
	git clone https://github.com/vim/vim.git
fi
cd vim
git checkout tags/v8.0.1850
vi_cv_path_python=/usr/bin/python3 ./configure \
	--with-features=huge \
	--enable-multibyte \
	--enable-rubyinterp=yes \
	--enable-pythoninterp=yes \
	--with-python-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
	--enable-python3interp=no \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-gui=gtk2 \
	--enable-cscope \
	--prefix=/usr/local
#build and install
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
cd ~/vim
sudo make install
#check vim version
vim --version
