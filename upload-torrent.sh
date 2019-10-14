#!/bin/bash

# Get Information from the user
clear
read -p "Magnet URI: " url

# Download the magnet using Aria2C
clear
aria2c "$url"

# Folder Selection
clear
echo "Please select the torrent folder:"
select folder in */
do
	test -n "$folder" && break
	echo "Please select valid folder"
done
# File Selection
echo "Please select the file to upload:"
cd $folder
select file in *
do
	test -n "$file" && break
	echo "Please select valid file"
done

# Check if the user is Logged in
clear
gdrive about

# Upload the file using Gdrive
clear
gdrive upload "${folder}${file}"

# Delete folder after process is completed
clear
rm -rf $folder

# Pause and exit
read -n 1 -s -r -p "Press any key to continue"
clear