#!/bin/sh

UCLIBC_HOME="${HOME}/arm-uclibc"
export PATH=${UCLIBC_HOME}/bin:"$PATH"
#export LD_LIBRARY_PATH=${UCLIBC_HOME}/lib:"$LD_LIBRARY_PATH"

if test ! -f "./.config"; then
	make cooldroid_selinux_defconfig CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabi-
fi

make -j4 "$@" CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabi-
