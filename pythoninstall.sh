#!/bin/bash

sudo apt -y install python2
sudo apt -y install python3
sudo apt -y install wget
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
echo 'export PATH="/home/rahul/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
sudo apt -y install python3-pip