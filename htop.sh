#!/bin/bash

distro=$(cat /etc/os-release | grep "^ID=" | cut -d "=" -f2 | sed 's/"//g')

if [ "$distro" = "rhel" ]; then
    sudo yum update -y > /dev/null
    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y > /dev/null
    sudo dnf install htop -y > /dev/null
    htop
elif [ "$distro" = "ubuntu" ]; then
    sudo apt-get update -y > /dev/null
    sudo apt-get install htop -y > /dev/null
    htop
else
    echo "Unsupported Distribution - Only RHEL and Ubuntu supported."
    exit 1
fi
