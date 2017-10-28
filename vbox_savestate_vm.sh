#!/bin/bash
#===============================================================================
#
#          FILE: vbox_start_vm_headless.sh
#
#         USAGE: ./vbox_start_vm_headless.sh
#
#===============================================================================

vm_name=$1

if [[ $vm_name ]]
then
    VBoxManage controlvm $vm_name savestate
else
    echo "Please enter vm name"
fi

