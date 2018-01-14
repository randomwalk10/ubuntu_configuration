#set vim as default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
#install prerequisite
sudo apt-get install build-essential cmake exuberant-ctags
#get vimrc file and install vundle
cd ~
rm -rf ./.vim
mkdir .vim
cd .vim
git clone https://github.com/randomwalk10/vim .
cd ~/.vim
mkdir bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#get vimrc file and install all plugins
cd ~/.vim
vim +PluginInstall +qall
#build youcomepleteme
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
#need to manually configure youcompleteme for better code completion
#create a symbol for vimrc file
cd ~
rm -f .vimrc
ln -s ~/.vim/vimrc ~/.vimrc
