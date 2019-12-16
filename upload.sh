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

# Uploader Function
startUpload() {
    clear
    $drive_folder_id = "1oknCkmF9lx7LyjzHF92iLAYf9WrQWXAq"
    case $downloadType in
        "Torrent")
            gdrive upload "${file}"
            # Delete folder after process is completed
            cd ..
            rm -rf "${folder}"
        ;;
        "File")
            gdrive --parent "$drive_folder_id" upload "$name" --delete
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

# Folder selection
if [ $downloadType == "Torrent" ]
then
    clear
    echo "Please select the torrent folder:"
    select folder in */
    do
        test -n "$folder" && break
        echo "Please select valid folder."
    done
    # File Selection
    echo "Please select the file to upload:"
    cd $folder
    select file in *
    do
        test -n "$file" && break
        echo "Please select valid file."
    done
fi

# Start Upload
startUpload

# Pause and exit
clear
read -n 1 -s -r -p "Press any key to continue"
clear
exit 1
