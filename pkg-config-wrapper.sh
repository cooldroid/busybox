#!/bin/sh

UCLIBC_HOME=/media/android/buildroot/output/host/usr
SYSROOT=${UCLIBC_HOME}/arm-buildroot-linux-uclibcgnueabi/sysroot

#export PKG_CONFIG_DIR=
#export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig
#export PKG_CONFIG_PATH=${UCLIBC_HOME}/lib/pkgconfig:${SYSROOT}/usr/lib/pkgconfig
#export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}

PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-$SYSROOT/usr/lib/pkgconfig:$SYSROOT/usr/share/pkgconfig} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-$SYSROOT} pkg-config "$@"
