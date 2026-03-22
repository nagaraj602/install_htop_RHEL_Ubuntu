#!/bin/bash

distro=$(cat /etc/os-release | grep "^ID=" | cut -d "=" -f2 | sed 's/"//g')

if [ "$distro" = "rhel" ]; then
    sudo yum update -y > /dev/null 2>&1
    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y > /dev/null 2>&1
    sudo dnf install htop -y > /dev/null 2>&1
    htop
elif [ "$distro" = "ubuntu" ]; then
    sudo apt-get update -y > /dev/null
    sudo apt-get install htop -y > /dev/null
    htop
else
    echo "Unsupported Distribution - Only RHEL and Ubuntu supported."
    exit 1
fi


cd;sudo yum install git -y > /dev/null 2>&1;git clone https://github.com/nagaraj602/install_package_options_RHEL_Ubuntu.git > /dev/null 2>&1;cd install_package_options_RHEL_Ubuntu;bash install.sh
