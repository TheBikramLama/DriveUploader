#!/bin/bash

# Logout the user by deleting the token
rm .gdrive/token_v2.json
clear
echo "Logged out!"
read -n 1 -s -r -p "Press any key to continue."
clear