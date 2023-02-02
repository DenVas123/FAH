#!/bin/bash

sudo ./clean.sh

#Extract squashfs-root and analyse busybox binary in it.

binwalk -e "${1}" > /dev/null 2>&1
file ./_"${1}".extracted/squashfs-root/bin/busybox > log1.txt


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

#Stores squash-fs in a tar archive and copies it to a specified place

tar -zcvf "${1}".tar.gz _"${1}".extracted/squashfs-root

cp "${1}".tar.gz ./extracted

#Run qemu with the required architecture

sudo ./run.sh "$ARCH"

