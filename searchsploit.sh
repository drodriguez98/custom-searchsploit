#!/bin/bash

# Install dependencies if required

if ! command -v git &> /dev/null || ! command -v searchsploit &> /dev/null; then

    echo "Installing required dependencies"
    sudo apt update > /dev/null

fi

# Git

if ! command -v git &> /dev/null; then

    echo "Installing Git"
    sudo apt install git -y > /dev/null

else

    echo "Git is already installed on the system"

fi

# Searchsploit

if ! command -v searchsploit &> /dev/null; then

    echo "Installing searchsploit"
    git clone https://gitlab.com/exploit-database/exploitdb.git && cd exploitdb/ && mv * /usr/bin && cd .. && rm -r exploitdb/

else

    echo "Searchsploit is already installed on the system"

fi

echo "Dependencies installed"

# Search input

read -p "What do you want to find vulnerabilities about? " package
read -p "Add the version of the package (Not required): " version

searchsploit $package $version

# Exploit to download input

read -p "What exploit do you want to download? " exploit

searchsploit -m $exploit