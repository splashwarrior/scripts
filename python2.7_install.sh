#!/bin/sh

yum groupinstall "Development tools"
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel
cd /tmp
cp /scratch/mhughes/Python-2.7.9.tar.xz .
tar xf Python-2.7.9.tar.xz
cd Python-2.7.9
./configure --prefix=/usr/local
make
make altinstall
cd ..
cp /scratch/mhughes/ez_setup.py .
/usr/local/bin/python2.7 ez_setup.py
/usr/local/bin/easy_install-2.7 pip
/usr/local/bin/easy_install-2.7 pycrypto
/usr/local/bin/easy_install-2.7 pyserial

sudo yum install wxPython.x86_64
sudo yum install numpy
sudo yum install agg
sudo yum install pyserial
sudo pip install --upgrade pip
pip install matplotlib
