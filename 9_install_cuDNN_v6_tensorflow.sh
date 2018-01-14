#download
CUDNN_TAR_FILE="cudnn-8.0-linux-x64-v6.0.tgz"
if [ ! -f "$CUDNN_TAR_FILE" ]; then
	wget http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/${CUDNN_TAR_FILE}
fi
rm -rf cuda/
tar -xzvf ${CUDNN_TAR_FILE}
#install
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-8.0/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-8.0/lib64/
sudo chmod a+r /usr/local/cuda-8.0/lib64/libcudnn*
#activate py2
workon py2
#install tensorflow
pip install --upgrade tensorflow-gpu
#test tensorflow
if [ ! -d "tensorflow" ]; then
	git clone https://github.com/tensorflow/tensorflow.git
fi
python tensorflow/tensorflow/examples/tutorials/mnist/fully_connected_feed.py
