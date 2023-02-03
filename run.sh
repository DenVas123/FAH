#!/bin/bash

source ./FAH.config

#Based on what the architecture is, runs qemu full system emulation with a precompiled kernel and image

if [ "${1}" = "mips" ]; then
	sudo qemu-system-mips -M malta -m 1024 -kernel ./"${MIPS_DIR}"vmlinux-3.2.0-4-4kc-malta -nographic -drive format=qcow2,file=./"${MIPS_DIR}"debian_wheezy_mips_standard.qcow2 -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -append "root=/dev/sda1 rw console=ttyS0" 

elif [ "${1}" = "mipsel" ]; then
        sudo qemu-system-mipsel -M malta -m 256 -kernel ./"${MIPSEL_DIR}"vmlinux-3.2.0-4-4kc-malta -nographic -hda ./"${MIPSEL_DIR}"debian_wheezy_mipsel_standard.qcow2 -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -append "root=/dev/sda1 rw console=ttyS0"
elif [ "${1}" = "arm" ]; then
	sudo qemu-system-arm -M vexpress-a9 -m 256 -kernel ./"${ARM_DIR}"vmlinuz-3.2.0.4-vexpress -initrd ./"${ARM_DIR}"initrd.img-3.2.0-4-vexpress -nographic -drive if=sd,file=./"${ARM_DIR}"debian_wheezy_armhf_standard.qcow2 -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -append "root=/dev/sda1 rw console=ttyS0"
elif [ "${1}" = "armel" ]; then
	sudo qemu-system-arm -M versatilepb -m 256 -kernel ./"${ARMEL_DIR}"vmlinuz-3.2.0-4-versatile -initrd ./"${ARMEL_DIR}"initrd.img-3.2.0-4-versatile -nographic -hda ./"${ARMEL_DIR}"debian_wheezy_armel_standard.qcow2 -net user,hostfwd=tcp::2222-:22 -net nic,model=e1000 -append "root=/dev/sda1 rw console=tty50"
fi


