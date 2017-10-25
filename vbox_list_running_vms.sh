#!/bin/bash -

VBoxManage list runningvms | awk ' { print $1 }' | cut -d \" -f 2
