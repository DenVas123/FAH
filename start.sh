#!/bin/bash

#Starts the script. If Error occurs, try using sudo

if [ $# -eq 0 ]
then
	echo "Usage: ./start.sh <firmware name> ie. ./start.sh Archer.bin"
else

	./findArch.sh "${1}"
fi
