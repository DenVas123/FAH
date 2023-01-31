#!/bin/bash

sshpass -proot scp -r -P 2222 ./extracted/* root@127.0.0.1:/root/squashfs-root StrictHostKeyChecking=no
sshpass -proot scp -r -P 2222 ./chroot.sh root@127.0.0.1:/root

