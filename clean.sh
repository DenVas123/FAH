#!/bin/bash
exec 3>&1 &>/dev/null
sudo rm -r *.extracted
sudo rm -r *.tar.gz
sudo rm -r .tar.gz
sudo rm -r log*
sudo rm -r *.qcow
sudo rm -r ./Images
mkdir Images
sudo rm -r ./extracted/*.tar.gz
sudo rm ./extracted/.tar.gz
sudo rm *.tar.xz
sudo rm log*
sudo rm 1.txt

