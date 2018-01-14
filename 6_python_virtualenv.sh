#install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
#install virtualenv and virtualenvwrapper
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ./get-pip.py ./.cache/pip
#update ~/.bashrc
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc
#create virtual environment
mkvirtualenv py2 -p python2
#activate
workon py2
#install numpy
pip install numpy
