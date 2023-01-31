Welcome to Firmware Analysis Helper!

By using the program you agree to the conditions specified in LICENSE.txt

This software was developed and tested on UBUNTU 18.04 using primarily the TP-Link Archer A7 Archer A7(US)_V5_210519 

This program aims to streamline automated penetration testing in of binaries in firmware through the use of full system qemu emulation

Instructions:
1) Open Terminal
2) Ensure you are inside the FAH directory
4) If this is the first time using FAH run sudo ./setup.sh to download prerequisites
3) Copy firmware .bin file into FAH directory
4) run sudo ./start.sh <firmware.bin>    eg. start.sh Archer.bin
5) This should start a qemu machine with a similar kernel and image. Open another terminal
6) cd FAH; sudo ./transfer.sh in the new termianl
7) In the QEMU emulation, ./chroot.sh
8) Done, enjoy testing firmware binaries



Note that this tool is in very early stages of prototyping and is probably not going to work as expected for some firmware. Adjust scripts if necessary.

Due to not being a perfect emulation some of the binaries and scripts in the emulated firmware may not work as intended. 

To clean program from extracted files run ./clean.sh This is automatically run every time the program is started.
