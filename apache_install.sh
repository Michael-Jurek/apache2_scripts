#!/bin/bash

# Define Apache version to be installed (default is Apache 2.4.54)
APACHE_VERSION=${1:-2.4.54}

# Define the installation directory for Apache
INSTALL_DIR="/usr/local/apache$APACHE_VERSION"


# Define the paths to the required libraries
OPENSSL_PATH="/usr/local/openssl"
PCRE_PATH="/usr/local/pcre"

print_usage(){
    echo "Usage: apache_install.sh [VERSION] "
    echo "Default VERSION is 2.4.54"
}

# Install necessary tools and libraries
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev libpcre3-dev libapr1-dev libaprutil1-dev

##=======================
# 1) Download Apache source code and install it
wget "http://archive.apache.org/dist/httpd/httpd-$APACHE_VERSION.tar.gz"
# extract source code
tar -xf httpd-$APACHE_VERSION.tar.gz
cd httpd-$APACHE_VERSION/
# configure Apache with desired options
# --prefix --> specifies installation directory
# --enable-mods-shared --> enables all modules to be shared
# ssl --> for HTTPS
# pcre -->
./configure --prefix=${INSTALL_DIR} --enable-mods-shared=all #--enable-ssl --with-ssl=${OPENSSL_PATH} --with-pcre=${PCRE_PATH}
# compile source code
make
# install Apache
sudo make install
cd ../

# 2) 

# Verify instalation
${INSTALL_DIR}/bin/apachectl -t
