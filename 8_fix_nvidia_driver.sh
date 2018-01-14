#stop gui
sudo service lightdm stop
#download driver
if [ ! -f "./NVIDIA-Linux-x86_64-384.111.run" ]; then
	wget http://us.download.nvidia.com/XFree86/Linux-x86_64/384.111/NVIDIA-Linux-x86_64-384.111.run
fi
#install driver
sudo sh NVIDIA-Linux-x86_64-384.111.run
#start gui
sudo service lightdm start
#reboot
sudo reboot
