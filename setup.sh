#!/bin/bash

wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2
wget -P ./linux/Mips https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2
wget -P ./linux/Mipsel https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/debian_wheezy_armhf_standard.qcow2
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/initrd.img-3.2.0-4-vexpress
wget -P ./linux/Arm https://people.debian.org/~aurel32/qemu/armhf/vmlinuz-3.2.0-4-vexpress
