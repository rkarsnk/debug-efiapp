#!/bin/bash
EDK2_DIR=~/edk2
WORKSPACE=$EDK2_DIR source $EDK2_DIR/edksetup.sh --reconfig;\
	WORKSPACE=$EDK2_DIR build -p OvmfPkg\/OvmfPkgX64.dsc -b DEBUG -a X64 -t CLANG38

cp ~/edk2/Build/OvmfX64/DEBUG_CLANG38/FV/OVMF_* ~/debug-efiapp

