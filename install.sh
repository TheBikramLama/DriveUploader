#!/bin/bash

# Install Gdrive
go get github.com/prasmussen/gdrive

# Install Aria2c
sudo apt-get install aria2

# Make Executables
chmod +x upload.sh
chmod +x logout.sh

# Exit
clear
read -n 1 -s -r -p "Gdrive Uploader Ready."
clear