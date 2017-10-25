#!/bin/bash -

VBoxManage list vms | awk ' { print $1 }' | cut -d \" -f 2
