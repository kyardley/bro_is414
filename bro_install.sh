#!/bin/bash
#Script to install bro (aka zeek)

sudo apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python-dev swig zlib1g-dev
wget https://www.zeek.org/downloads/bro-2.6.1.tar.gz -P /root/Downloads/
tar -xzvf /root/Dowloads/bro-2.6.1.tar.gz
cd /root/Downloads/bro-2.6.1/
/root/Downloads/bro-2.6.1/configure
make
sudo make install
export PATH=$PATH:/usr/local/bro/bin
rm -rd /root/Downloads/bro-2.6.1/
rm /root/Dowloads/bro-2.6.1.tar.gz
