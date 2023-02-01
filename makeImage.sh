#!/bin/bash

#This is an in developemnt script that builds a qemu image from a root-fs file extracted from the firmware. The qemu image currently does not seem to work, likely isnt built entirely correctly.

source ./FAH.config

TARBALL_SIZE=$(tar ztvf "${1}" --totals 2>&1 |tail -1|cut -f4 -d' ')
MINIMUM_IMAGE_SIZE=$((TARBALL_SIZE + 10 * 1024 * 1024))
IMAGE_SIZE=8388608
echo "${TARBALL_SIZE}">1.txt
while [ $IMAGE_SIZE -le $MINIMUM_IMAGE_SIZE ]
do
    IMAGE_SIZE=$((IMAGE_SIZE*2))
done

IMAGE="./linux/Mips/debian_wheezy_mips_standard.qcow2"
#IMAGE="./Images/Image.img"
#qemu-img create -f raw "${IMAGE}" "${IMAGE_SIZE}"
#chmod a+rw "${IMAGE}"

echo -e "o\nn\np\n1\n\n\nw" | /sbin/fdisk "${IMAGE}"

DEVICE=$(get_device "$(kpartx -a -s -v "${IMAGE}")")
sleep 1

#mkfs.ext2 -F "${DEVICE}"
sync

IMAGE_DIR="./Images/Image"

if [ ! -e "${IMAGE_DIR}" ]; then
    mkdir "${IMAGE_DIR}"
fi

mount -t ext2 "${DEVICE}" "${IMAGE_DIR}"

#tar -xf "${1}" -C extracted
#cp -r ./extracted/*/squashfs-root/. ./Images/Image/
#sync
#umount "${DEVICE}"
#kpartx -d "${IMAGE}"
#losetup -d "${DEVICE}" &>/dev/null
#dmsetup remove $(basename "$DEVICE") &>/dev/null

#qemu-img convert -f raw -O qcow2 ./Images/Image.img ./Images/Image.qcow2
#chmod a+rw "./Images/Image.qcow2"
#shell -c 'mpirun sudo ./run.sh' & sleep 1m;echo "a"

#konsole --noclose -e sudo ./run.sh "${2}";
#echo "test"

#sudo ./run.sh "${2}"
