#!/bin/bash

./clean.sh
binwalk -e --run-as=root "${1}" > /dev/null 2>&1
file ./_"${1}".extracted/squashfs-root/bin/busybox > log1.txt


result=$( grep 'MIPS\|MIPSEL\|ARM\|MIPS32\|MIPS\|arm\|mips32\|mipsel' log1.txt)

MIPS='MIPS'
MIPSEL='MIPSEL'
ARM='ARM'



if [[ "$result" == *"$MIPSEL"* ]]
then
	ARCH="mipsel"
elif [[ "$result" == *"$MIPS"* ]]
then
	ARCH="mips"
elif [[ "$result" == *"$ARM"* ]]
then 
	ARCH="arm"
else
	echo "wrong architecture"
fi
 
tar -zcvf "${1}".tar.gz _"${1}".extracted/squashfs-root

cp "${1}".tar.gz ./extracted

sudo ./run.sh "$ARCH"

