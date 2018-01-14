#clean existing cuda
sudo apt-get purge nvidia-cuda*
sudo apt-get purge nvidia-*
sudo apt-get purge nvidia*
sudo apt-get autoremove
#stop gui
sudo service lightdm stop
#disable nouveau
sudo cp ./blacklist-nouveau.conf /etc/modprobe.d/
sudo update-initramfs -u
#install cuda 8(need to disable opengl)
sudo sh cuda_8.0.61_375.26_linux.run --override
#add to path
cat >> ~/.bashrc << 'EOF'
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\
${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
EOF
source ~/.bashrc
#install patch
sudo sh cuda_8.0.61.2_linux.run 
#start gui
sudo service lightdm start
#display results
nvcc --version
nvidia-smi