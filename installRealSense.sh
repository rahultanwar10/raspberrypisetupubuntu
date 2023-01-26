sudo apt-get install -y libdrm-amdgpu1 libdrm-amdgpu1-dbgsym libdrm-dev libdrm-exynos1 libdrm-exynos1-dbgsym libdrm-freedreno1 libdrm-freedreno1-dbgsym libdrm-nouveau2 libdrm-nouveau2-dbgsym libdrm-omap1 libdrm-omap1-dbgsym libdrm-radeon1 libdrm-radeon1-dbgsym libdrm-tegra0 libdrm-tegra0-dbgsym libdrm2 libdrm2-dbgsym
sudo apt-get install -y libglu1-mesa libglu1-mesa-dev glusterfs-common libglu1-mesa libglu1-mesa-dev libglui-dev libglui2c2
sudo apt-get install -y libglu1-mesa libglu1-mesa-dev mesa-utils mesa-utils-extra xorg-dev libgtk-3-dev libusb-1.0-0-dev

# Installing TBB
cd ~/Desktop
mkdir tbb && cd tbb
wget https://github.com/PINTO0309/TBBonARMv7/raw/master/libtbb-dev_2018U2_armhf.deb
sudo dpkg -i libtbb-dev_2018U2_armhf.deb
sudo ldconfig

# Installing opencv
sudo apt -y autoremove libopencv3
cd ~/Desktop
mkdir opencv && cd opencv
wget https://github.com/mt08xx/files/raw/master/opencv-rpi/libopencv3_3.4.3-20180907.1_armhf.deb
sudo apt install -y ./libopencv3_3.4.3-20180907.1_armhf.deb
sudo ldconfig