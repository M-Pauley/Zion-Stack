#! /usr/bin/env bash
#
printf '
################################################################
# 01-snaps.sh -- Workstation Support Tool Script.
# 
# This script will install the following pre-requisites:
#   1. snapd
#       - apt package.
#   2. go task 
#       - snapcraft.
################################################################
'
################################################################
#
# To add applications to the list, add command to the applist 
# and create a function:
#       install_applicationname(){...}
#
# Inside the function will be the applicable commands to install
# the application. Use is intended for applications which cannot
# be installed within a GO taskfile.
#
################################################################

applist=("snap" "task")

exists(){
    command -v "${app}" > /dev/null 2>&1;
}
clear
appcheck(){
for app in "${applist[@]}"; do
    if exists "${app}"; then
        echo "${app} is installed."
    else 
        echo "${app} is not installed."
        while true; do
            read -p -r "Do you wish to install this program? " yn
            case $yn in
                [Yy]* ) install_"${app}"; appcheck;;
                [Nn]* ) exit;;
                * ) echo "Please answer Y or N.";;
            esac
        done
    fi
    printf '
All pre-requisit programs have been installed.
Please continue by using tasks.
'
done
}

install_snap(){
    sudo apt update
    sudo apt install snapd
    appcheck
}

install_task(){
    sudo snap install task --classic
    appcheck
}