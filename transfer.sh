#!/bin/bash

#Transfers the squashfs-root folder and chroot.sh script into the virtual machine through scp

#if transfer fails, remove "sshpass -proot" from the first command. This will prompt for a yes and then a password. Enter root as the password. This should onloy happen the first time this is ran on a machine, so it can changed back after to automate the process.


sshpass -proot scp -r -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=quiet -P 2222 ./extracted/* root@127.0.0.1:/root/squashfs-root > log.txt
sshpass -proot scp -r -o UserKnownHostsFile=/dev/null -o LogLevel=quiet -o StrictHostKeyChecking=no -P 2222 ./chroot.sh root@127.0.0.1:/root >> log.txt

echo "Done, go back to the qemu emulation and type ./chroot.sh"


