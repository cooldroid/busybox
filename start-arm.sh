#!/bin/sh

UCLIBC_HOME=~/arm-uclibc
PATH=${UCLIBC_HOME}/bin:"$PATH"
LD_LIBRARY_PATH=${UCLIBC_HOME}/lib:"$LD_LIBRARY_PATH"

if test ! -f "./.config"; then
	make cooldroid_selinux_defconfig
fi;
#make -j4 CC=arm-buildroot-linux-uclibcgnueabi-gcc CFLAGS='-Os -I /root/arm-uclibc/include -I /root/selinux/libselinux*/include -I /root/selinux/libsepol*/include' LDFLAGS='-static -L /root/selinux/libselinux*/src -L /root/selinux/libsepol*/src -L /root/selinux/pcre*/.libs'
make -j4 "$@" CROSS_COMPILE=arm-buildroot-linux-uclibcgnueabi- CFLAGS="-Os -I ${UCLIBC_HOME}/include"

if [ $# -eq 0 ]; then
	cp ./busybox /sdcard/system/develop/
fi;
