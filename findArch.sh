#!/bin/bash

sudo ./clean.sh

#Extract squashfs-root and analyse busybox binary in it.
echo "Extracting Firmware"
binwalk -e "${1}" > /dev/null 2>&1
file ./_"${1}".extracted/squashfs-root/bin/busybox > log1.txt
if [ ! -f ./_"${1}".extracted/squashfs-root/bin/busybox ]; then
	echo "Something went wrong when extracting, exiting"
	exit
fi

echo "Extraction Done"

result=$( grep 'MIPS\|MIPSEL\|ARM\|MIPS32\|MIPS\|arm\|mips32\|mipsel' log1.txt)

MIPS='MIPS'
ARM='ARM'
MSB='MSB'
LSB='LSB'

edianess=$( grep 'MSB\|LSB' log1.txt)

#Determines architecture and edianess from log file

if [[ "$result" == *"$MIPS"* ]]
then
	if [[ "$edianess" == *"$LSB"* ]]
	then 
		ARCH="mipsel"
	else
		ARCH="mips"
	fi
elif [[ "$result" == *"$ARM"* ]]
then 
	if [[ "$edianess" == *"$LSB"* ]]
	then 
		ARCH="armel"
	else
		ARCH="arm"
	fi
else
	echo "Unable to determine architecture, possibly error extracting squashfs-root, firmware could be encrypted or in a weird format"
	exit
fi
echo "Architecture = ${ARCH}"
#Stores squash-fs in a tar archive and copies it to a specified place
echo "Copying squashfs-root"
tar -zcvf "${1}".tar.gz _"${1}".extracted/squashfs-root >> log1.txt

cp "${1}".tar.gz ./extracted >>log1.txt

#Run qemu with the required architecture
echo "Running QEMU, please wait"
sleep 3s
sudo ./run.sh "$ARCH"

