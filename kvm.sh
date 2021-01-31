#!/bin/zsh

QEMU="/usr/bin/qemu-system-x86_64"

${QEMU} \
    -enable-kvm \
    -m 4096 \
    -machine q35,accel=kvm \
    -cpu host,hv_relaxed,hv_vapic,hv_spinlocks=0x1000 \
    -smp 4,sockets=1,cores=4,threads=1 \
    -drive if=pflash,format=raw,readonly,file=/usr/share/ovmf/x64/OVMF.fd \
    -drive if=pflash,format=raw,file=/usr/share/ovmf/x64/OVMF_VARS.fd \
    -vga std \
    -device usb-ehci,id=ehci -device usb-host,bus=ehci.0,vendorid=0x0951,productid=0x1666 \
    -boot d \
    -cdrom /home/sabmodem/brokenArch.iso \
    # -cdrom /home/sabmodem/install-amd64-minimal-20201118T214503Z.iso \
    # -hda gentoo.qcow2 \
