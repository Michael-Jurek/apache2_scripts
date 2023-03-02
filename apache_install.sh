#!/bin/bash

# Define the installation directory for Apache
#INSTALL_DIR="/usr/local/apache2"
INSTALL_DIR="./tmp/apache2"

# Define the paths to the required libraries
#OPENSSL_PATH="/usr/local/openssl"
#PCRE_PATH="/usr/local/pcre"
OPENSSL_PATH="./tmp/openssl"
PCRE_PATH="./tmp/pcre"

# Define Apache version to be installed
APACHE_VERSION=${1:-2.4.54}

# Install necessary tools and libraries
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev libpcre3-dev libapr1-dev libaprutil1-dev

echo "TEST: $APACHE_VERSION"

##=======================
# 1) Download Apache source code from the Apache website
#wget "http://archive.apache.org/dist/httpd/httpd-2.4.38.tar.gz"