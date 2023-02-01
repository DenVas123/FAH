#!/bin/bash

#if transfer fails, remove "sshpass -proot" from the first command. This will prompt for a yes and then a password. Enter root as the password. This should onloy happen the first time this is ran on a machine, so it can changed back after to automate the process.

sshpass -proot scp -r -P 2222 ./extracted/* root@127.0.0.1:/root/squashfs-root 
sshpass -proot scp -r -P 2222 ./chroot.sh root@127.0.0.1:/root

