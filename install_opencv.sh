#https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/

#sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
#1: Install OpenCV dependencies on Ubuntu 18.04
sudo apt-get update
sudo apt-get install build-essential cmake unzip pkg-config -y
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev -y

sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install libatlas-base-dev gfortran -y

sudo apt-get install python3-dev -y

# Download lib
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.0.0 opencv
mv opencv_contrib-4.0.0 opencv_contrib

#Configure your Python 3 virtual environment for OpenCV 
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py -y
sudo pip install virtualenv virtualenvwrapper -y
sudo rm -rf ~/get-pip.py ~/.cache/pip
#add the following lines to your ~/.bashrc
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

mkvirtualenv cv -p python3

pip install numpy

#CMake and compile OpenCV 4 for Ubuntu
cd ~/opencv
mkdir build
cd build
#Run Cmake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ..
make -j4
sudo make install && ldconfig

