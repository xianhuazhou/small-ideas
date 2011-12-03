#!/bin/sh

# update the new system
sudo apt-get update; sudo apt-get dist-upgrade -y 

# Install some basic libs & tools for compile source code and getting things done.
# It's based on Ubuntu 10.10, some lib's version No. need to be changed if the OS is not 10.10. 
sudo apt-get install \
libevent-dev \
libssl-dev \
libgd2-xpm-dev \
libzzip-dev \
libbz2-dev \
libpcre3-dev \
libpcre++-dev \
libxml2-dev \
libmcrypt-dev \
libreadline6-dev \
libc-client2007e-dev \
libdb-dev \
libdb4.8++-dev \
libcurl4-openssl-dev \
libxslt1-dev \
libt1-dev \
libaio1 \
ssh \
autoconf \
make \
libtool \
gcc \
g++ \
curl \
bzip2 \
unrar \
nmap \
snort \
tree \
vim \
shorewall \
cifs-utils \
smbclient \
samba-common \
nfs-common \
expect \
realpath \
