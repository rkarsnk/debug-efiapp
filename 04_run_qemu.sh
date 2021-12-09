#!/bin/bash
OVMF_DIR=`realpath ~/debug-efiapp/ovmf`
EFI_DIR=`realpath ~/debug-efiapp/efi`
echo OVMF_DIR=$OVMF_DIR
echo EFI_DIR=$EFI_DIR

# bootまでに8秒間待つ。ESCキーを押せばUEFI BIOSメニューに入れる。
sudo qemu-system-x86_64 -m 1G -boot menu=on,splash-time=8000\
	-drive if=pflash,format=raw,readonly,file=$OVMF_DIR/OVMF_CODE.fd \
	-drive if=pflash,format=raw,file=$OVMF_DIR/OVMF_VARS.fd \
	-drive if=ide,index=0,media=disk,format=raw,file=fat:rw:$EFI_DIR \
	-device nec-usb-xhci,id=xhci -device usb-mouse -device usb-kbd \
	-debugcon file:debug.log -global isa-debugcon.iobase=0x402 \
	-monitor stdio \
	-s

