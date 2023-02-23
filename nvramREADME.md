NVRAM work
At hte moment the libnvram library is from firmadyne 
https://github.com/firmadyne/libnvram
It needs to be modified to work without depending on other parts of firmadyne. This has not been done yet. It is copied to the root file system with the makeImage script, and gets transferred alongside it. chroot.sh that gets ran in the emulation uses LD_PRELOAD to intercept calls to nvram to it. 

Future work involves:
1) Getting nvram to work without firmadyne
2) Expanding the library to work with more router firmwares

Both require the library to be recompiled. config.h is likely the main file that needs to be changed for both.
