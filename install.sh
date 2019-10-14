#!/bin/bash

# Install Gdrive
go get github.com/prasmussen/gdrive

# Install Aria2c
sudo apt-get install aria2

# Make Executables
chmod +x upload.sh
chmod +x upload-torrent.sh
chmod +x logout.sh

# Exit
clear
echo "Uploader Ready."
read -n 1 -s -r -p "Press any key to continue."
clear