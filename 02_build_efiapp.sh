#!/bin/bash
EDK2_DIR=~/edk2

ln -snf ~/debug-efiapp/LoaderPkg ~/edk2/LoaderPkg
WORKSPACE=$EDK2_DIR source $EDK2_DIR/edksetup.sh --reconfig;\
	WORKSPACE=$EDK2_DIR build -p LoaderPkg/LoaderPkg.dsc -b DEBUG -a X64 -t CLANG38

cp ~/edk2/LoaderPkg/Build/X64/DEBUG_CLANG38/X64/Loader.debug ~/debug-efiapp/



