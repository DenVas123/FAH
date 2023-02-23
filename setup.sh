#!/bin/bash

#makes required directories

mkdir extracted
mkdir linux
mkdir ./linux/Mips
mkdir ./linux/Mipsel
mkdir ./linux/Arm
mkdir ./linux/Armel

#downloads precompiled kernels and images for all architectures

wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2
wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/debian_wheezy_armhf_standard.qcow2
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/initrd.img-3.2.0-4-vexpress
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/vmlinuz-3.2.0-4-vexpress
wget -P ./linux/Armel https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2
wget -P ./linux/Armel https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile
wget -P ./linux/Armel https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile

#installs required packages

sudo apt install binwalk -y
sudo apt install qemu-system-mips -y
sudo apt install qemu-system-arm -y
sudo apt install python -y
sudo apt install python3 -y
sudo apt install python-pip -y
sudo pip install nose coverage -y
sudo apt-get install libqt4-opengl python3-opengl python3-pyqt4 python3-pyqt4.qtopengl python3-numpy python3-scipy python3-pip -y
sudo apt-get install mtd-utils gzip bzip2 tar arj lhasa p7zip p7zip-full cabextract cramfsswap squashfs-tools sleuthkit default-jdk lzop srecord -y
sudo apt install sshpass -y
sudo apt-get install openssh-server -y


