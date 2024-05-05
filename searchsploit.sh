#!/bin/bash

# Setting up colors for better readability

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Install dependencies if required

if ! command -v git &> /dev/null || ! command -v searchsploit &> /dev/null; then

    echo -e "${turquoiseColour}Updating repositories${endColour}"
    sudo apt update > /dev/null

fi

# Git

if ! command -v git &> /dev/null; then

    echo -e "${turquoiseColour}Installing Git${endColour}"
    sudo apt install git -y > /dev/null

else

    echo -e "${greenColour}Git is already installed on the system${endColour}"

fi

# Searchsploit

if ! command -v searchsploit &> /dev/null; then

    echo -e "${turquoiseColour}Installing searchsploit${endColour}"
    git clone https://gitlab.com/exploit-database/exploitdb.git && cd exploitdb/ && mv * /usr/bin && cd .. && rm -r exploitdb/

else

    echo -e "${greenColour}Searchsploit is already installed on the system${endColour}"

fi

echo -e "${greenColour}Dependencies installed${endColour}"

echo "Dependencies installed"

# Search input

read -p "What do you want to find vulnerabilities about? " package
read -p "Add the version of the package (Not required): " version

searchsploit $package $version

# Exploit to download input

read -p "What exploit do you want to download? " exploit

searchsploit -m $exploit