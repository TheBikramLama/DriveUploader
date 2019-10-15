#!/bin/bash

# Command Checker function
checkCommand() {
    local commands=(gdrive aria2c)
    for command in "${commands[@]}"
    do
        if hash $command 2>/dev/null; then
            continue
        else
            clear
            echo "${command} is not installed."
            echo "Please run the install.sh"
            echo ""
            read -n 1 -s -r -p "Press any key to continue."
            clear
            exit 1
        fi
    done
}

# Gdrive Login Checker
checkGdrive() {
    clear
    gdrive about
    clear
}

# Downloader Function
startDownload() {
    clear
    case $downloadType in
        "Torrent")
            aria2c --seed-time=0 --max-upload-limit=5K "$url"
        ;;
        "File")
            aria2c -o "$name" "$url"
        ;;
    esac
}

# Check if commands are installed properly
checkCommand
# Check if Gdrive is logged in
checkGdrive

# Download Type Selection Menu
clear
echo "Select an option"
select downloadType in Torrent File
do
	test -n "$downloadType" && break
	echo "Please select valid option"
done

# Get Information from the user
clear
case $downloadType in
    "Torrent")
        read -p "Magnet URI: " url
    ;;
    "File")
        read -p "Download URL: " url
        read -p "Desired Name: " name
    ;;
esac

# Start Download process
startDownload

exit 1

# Get Information from the user
clear
read -p "Download URL: " url
read -p "Desired Name: " name

# Check if the user is Logged in
clear
gdrive about

# Download the file using Aria2C
clear
aria2c -o "$name" "$url"

# Upload the file using Gdrive
clear
gdrive upload "$name" --delete

# Pause and exit
read -n 1 -s -r -p "Press any key to continue"
clear
