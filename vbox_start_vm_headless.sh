#!/bin/bash -
#===============================================================================
#
#          FILE: vbox_start_vm_headless.sh
#
#         USAGE: ./vbox_start_vm_headless.sh
#
#===============================================================================

vm_name=$1

if [[ $1 ]]
then
    VBoxManage startvm -type headless $vm_name
else
    echo "Please enter vm name"
fi

