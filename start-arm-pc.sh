#!/bin/sh

UCLIBC_HOME="${HOME}/arm-uclibc"
SYSROOT=$(cd ${UCLIBC_HOME}/arm-*/sysroot; pwd)
TOOLCHAIN=`ls ${UCLIBC_HOME}/bin | grep -E "arm.+-linux-.+gcc$" | awk -F-gcc '{print $1}'`
PATH=${UCLIBC_HOME}/bin:$PATH
#export LD_LIBRARY_PATH=${UCLIBC_HOME}/${TOOLCHAIN}/sysroot/usr/lib:"$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${SYSROOT}/lib/pkgconfig
export LD_LIBRARY_PATH=${UCLIBC_HOME}/lib

CMD_PREFIX="ARCH=arm CROSS_COMPILE=${TOOLCHAIN}- CONFIG_SYSROOT=$SYSROOT CFLAGS=\"-O2 -I${UCLIBC_HOME}/include\""

if test ! -f "./.config"; then
	eval make cooldroid_selinux_defconfig
fi

#sed -i.bak -e "s|.*CONFIG_SYSROOT=.*|CONFIG_SYSROOT=\"$SYSROOT\"|" .config && touch -r .config.bak .config
eval $CMD_PREFIX make -j4 "$@"
