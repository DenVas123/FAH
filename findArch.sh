#!/bin/bash

sudo ./clean.sh
binwalk -e "${1}" > /dev/null 2>&1
file ./_"${1}".extracted/squashfs-root/bin/busybox > log1.txt


result=$( grep 'MIPS\|MIPSEL\|ARM\|MIPS32\|MIPS\|arm\|mips32\|mipsel' log1.txt)

MIPS='MIPS'
ARM='ARM'
MSB='MSB'
LSB='LSB'

edianess=$( grep 'MSB\|LSB' log1.txt)

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
	echo "wrong architecture"
fi
 
tar -zcvf "${1}".tar.gz _"${1}".extracted/squashfs-root

cp "${1}".tar.gz ./extracted

sudo ./run.sh "$ARCH"

