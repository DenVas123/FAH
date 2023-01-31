#!/bin/bash

wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2
wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/debian_wheezy_armhf_standard.qcow2
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/initrd.img-3.2.0-4-vexpress
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/vmlinuz-3.2.0-4-vexpress


sudo apt install binwalk
sudo apt install qemu-system-mips
sudo apt install qemu-system-arm
sudo apt install python 
sudo apt install python3
sudo apt install python-pip
sudo pip install nose coverage
sudo apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pip
sudo apt-get install mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools sleuthkit default-jdk lzop srecord
