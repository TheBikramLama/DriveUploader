#!/bin/bash

# Get Information from the user
clear
read -p "Download URL: " url
read -p "Desired Name: " name

# Download the file using Aria2C
clear
aria2c -o "$name" "$url"

# Check if the user is Logged in
clear
gdrive about

# Upload the file using Gdrive
clear
gdrive upload "$name" --delete

# Pause and exit
read -n 1 -s -r -p "Press any key to continue"
clear