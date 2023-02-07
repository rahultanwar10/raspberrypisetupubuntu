sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install automake libtool vim cmake libusb-1.0-0-dev libx11-dev xorg-dev libglu1-mesa-dev libssl-dev libtbb-dev

cd ~
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo su << EOF
udevadm control --reload-rules && udevadm trigger
exit
EOF

echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc

wget https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protobuf-all-21.12.tar.gz
tar -xzvf protobuf-all-21.12.tar.gz
cd protobuf-all-21.12
./configure
make -j4
sudo make install
cd python
export LD_LIBRARY_PATH=../src/.libs
python3 setup.py build --cpp_implementation 
python3 setup.py test --cpp_implementation
sudo python3 setup.py install --cpp_implementation
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=cpp
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION_VERSION=3
sudo ldconfig
protoc --version

cd ~
cd librealsense
mkdir  build  && cd build
cmake .. -DBUILD_EXAMPLES=true -DCMAKE_BUILD_TYPE=Release -DFORCE_LIBUVC=true
make -j1
sudo make install

cmake .. -DBUILD_PYTHON_BINDINGS=bool:true -DPYTHON_EXECUTABLE=$(which python3)
make -j4
sudo make install

echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib' >> ~/.bashrc
source ~/.bashrc

sudo apt-get install python3-opengl
sudo -H pip3 install pyopengl
sudo pip3 install git+https://github.com/mcfletch/pyopengl.git@227f9c66976d9f5dadf62b9a97e6beaec84831ca#subdirectory=accelerate