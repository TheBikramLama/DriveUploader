#!/bin/bash

# Logout the user by deleting the token
rm .gdrive/token_v2.json
clear
read -n 1 -s -r -p "Logged out!"
clear