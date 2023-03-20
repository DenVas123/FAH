#!/bin/bash
tar -xzvf squashfs-root > log.txt
mv ./*.extracted ./firmware
mount -t proc /proc firmware/squashfs-root/proc/
mount --rbind /sys firmware/squashfs-root/sys/
mount --rbind /dev firmware/squashfs-root/dev/
mount --rbind /var firmware/squashfs-root/var/
chroot ~/firmware/squashfs-root /bin/sh
export LD_PRELOAD=./libnvram.sh 
