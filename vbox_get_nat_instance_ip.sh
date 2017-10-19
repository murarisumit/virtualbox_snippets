#!/bin/bash -
#===============================================================================
#
#          FILE: vbox_get_nat_instance_ip.sh
#
#         USAGE: ./vbox_get_nat_instance_ip.sh
#===============================================================================

box_name=$1

if [[ $1 ]]
then
    output=$(VBoxManage guestproperty enumerate $box_name | grep "/VirtualBox/GuestInfo/Net/0/V4/IP")
    if [[ $output ]]
    then
        echo $output | cut -d , -f 2 | cut -d : -f 2
    else
        echo "/VirtualBox/GuestInfo/Net/0/V4/IP no such field found"
    fi
else
    echo "Please enter the node name."
fi

