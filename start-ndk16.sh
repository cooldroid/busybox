#!/bin/sh

CC_LOC="/media/android/toolchain/ndk-aarch64-linux-android"
TRIPLE=`ls ${CC_LOC}/bin | grep -E "aarch64.+linux-.+gcc$" | awk -F-gcc '{print $1}'`

export PATH=${CC_LOC}/bin:$PATH
export CC="$CC_LOC/bin/${TRIPLE}-gcc"
export CXX="$CC_LOC/bin/${TRIPLE}-g++"

CMD_PREFIX="ARCH=arm64 CFLAGS=\"-Os -static\" CROSS_COMPILE=$CC_LOC/bin/${TRIPLE}-"

if test -f ./Makefile; then
	#find . -name "Makefile" -print0 | xargs -0 sed -i -e s/'CFLAGS = -g -Os'/'CFLAGS = -g -Os -static'/g
	eval $CMD_PREFIX make -j4 "$@"
fi
