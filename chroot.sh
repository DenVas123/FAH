#!/bin/bash
tar -xzvf squashfs-root > log.txt
mv ./*.extracted ./firmware
chroot ~/firmware/squashfs-root /bin/sh
