#!/bin/bash
#===============================================================================
#
#          FILE: vbox_create_nat_network_instance.sh
#
#         USAGE: ./vbox_create_nat_network_instance.sh new_vm_name nat_network_name
#
#===============================================================================

set -o nounset                              # Treat unset variables as an error

virtualbox_home='/Users/hme/VirtualBox VMs'
vm_name=$1
#Default value to PuppetNetwork, if nothing specified
nat_network=${2:-PuppetNetwork}
base_multiattach_hdd="base_box_nat_dns_puppet.vdi"
OS="Ubuntu_64"

VBoxManage createvm --name $vm_name --ostype $OS --register
VBoxManage modifyvm $vm_name --nic1 natnetwork --nat-network1 $nat_network
VBoxManage modifyvm $vm_name --memory 512
VBoxManage storagectl $vm_name --name "sata1" --add sata
VBoxManage storageattach $vm_name --storagectl "sata1" --port 0 --device 0 --type hdd --medium "$virtualbox_home/$base_multiattach_hdd" --mtype multiattach
echo "Starting vm: $vm_name"
VBoxManage startvm $vm_name
