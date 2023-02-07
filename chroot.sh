#!/bin/bash
tar -xzvf squashfs-root
mv ./*.extracted ./firmware
chroot ~/firmware/squashfs-root /bin/sh
