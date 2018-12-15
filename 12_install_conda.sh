CONDA_DISTRO="Anaconda3-5.3.1-Linux-x86_64"
#download
curl -O https://repo.anaconda.com/archive/$CONDA_DISTRO.sh
#checksum
sha256sum $CONDA_DISTRO.sh
#run script
bash $CONDA_DISTRO.sh
#activate path
source ~/.bashrc
#install envs
conda env create -f ./conda_aind.yml
