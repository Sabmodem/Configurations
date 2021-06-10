#!/usr/bin/zsh

QEMU="/usr/bin/qemu-system-x86_64"

${QEMU} \
    -enable-kvm \
    -m 4096 \
    -machine q35,accel=kvm \
    -cpu host,hv_relaxed,hv_vapic,hv_spinlocks=0x1000 \
    -smp 4,sockets=1,cores=4,threads=1 \
    -device usb-ehci,id=ehci -device usb-host,bus=ehci.0,vendorid=0x0951,productid=0x1666 \
    -device usb-ehci,id=ehci1 -device usb-host,bus=ehci.0,vendorid=0x0951,productid=0x1642 \
    -drive if=pflash,format=raw,unit=0,file=/usr/share/OVMF/OVMF_CODE.fd,readonly=on \
    -drive if=pflash,format=raw,unit=1,file=/usr/share/OVMF/OVMF_VARS.fd \
    -vga std \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::2222-:22 \
