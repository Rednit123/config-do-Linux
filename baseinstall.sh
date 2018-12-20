#!/usr/bin/env bash

# Verify if the program conditions to run are satisfied
#=========================================================#
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

if [ -z $1 ]; then
    echo "Usage: ./baseinstall.sh <file>"
    exit
fi
#=========================================================#


# Update the repository and install the packages and 
#*highlight according to the success
#=========================================================#
apt-get update -y
if [ $? = 0 ]; then
    while IFS= read -r PACKAGE; do #"IFS=" read the file line by line
	apt-get install $PACKAGE -y
	if [ $? = 0 ]; then
	    echo -e "\e[1;32mInstalled:................ $PACKAGE \e[0m"
	else
	    echo -e "\e[1;31mFailed to Install:........ $PACKAGE \e[0m"
	fi
    done < $1
else
    echo "\e[1;31mFailed to update\e[0m"
fi
#==========================================================#
