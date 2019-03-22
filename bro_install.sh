#!/bin/bash
#Script to install bro (aka zeek)

sudo apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python-dev swig zlib1g-dev
mkdir /tmp/bro_install
wget https://www.zeek.org/downloads/bro-2.6.1.tar.gz -P /tmp/bro_install/
tar -xzvf /tmp/bro_install/bro-2.6.1.tar.gz -C /tmp/bro_install/
cd /tmp/bro_install/bro-2.6.1/
/tmp/bro_install/bro-2.6.1/configure
make
sudo make install
rm -rd /tmp/bro_install/
echo "Bro successfully installed; add /usr/local/bro/bin to your PATH variable"
