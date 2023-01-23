sudo apt -y install libpcl-dev
sudo apt -y install libopencv-dev
sudo apt -y install cmake
sudo apt -y install libfreenect-dev
sudo apt -y install libopenni2-dev
sudo apt -y install libsqlite3-dev
sudo apt -y install libvtk6-qt-dev


sudo apt remove libfreenect*
git clone https://github.com/OpenKinect/libfreenect.git
cd libfreenect
mkdir build
cd build
cmake ..
make
sudo make install