prev_dir="$PWD"

cd /usr/local/include/opencv
sudo ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ -f opencv.tags *.hpp *.h

cd /usr/local/include/opencv2
sudo ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++ -f opencv2.tags *.hpp *.h

cd "$prev_dir"
