#!/bin/bash

# ssh to your server and follow the steps below

sudo apt update

# install Java development kit

sudo apt install openjdk-8-jdk

# make sure it is installed

java -version

# create temp folder under current directory

mkdir temp

# cd into
# use wget to download the GeoServer zip file

wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.20.3/geoserver-2.20.3-bin.zip

# install unzip

sudo apt install unzip

# create main dir for geoserver

mkdir /usr/share/geoserver

# unzip the file
sudo unzip geoserver-2.20.3-bin.zip -d /usr/share/geoserver

# change owner of files under folder recursively
# replace 'bakhtiyar' with your username

sudo chown -R bakhtiyar /usr/share/geoserver

#and finally run start bash script

cd bin

./startup.sh

# open browser http://your_host_ip:8080/geoserver/
# username: admin
# password: geoserver