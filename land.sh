#!/bin/bash

#set -e
DATE_POSTFIX=$(date +"%Y%m%d")
# all needed paths for kernel

HOME_DIR=/home/utsavbalar1231
KERNEL_DIR=$PWD
KERNEL_TOOLCHAIN=$HOME_DIR/gcc9/bin/aarch64-linux-gnu-
CLANG_TOOLCHAIN=$HOME_DIR/clang/bin/clang-9
KERNEL_DEFCONFIG=land_defconfig
JOBS=8

BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
#red
red='\033[05;31m'

echo -e "$P // Setting up Toolchain //"
export CROSS_COMPILE=$KERNEL_TOOLCHAIN
export ARCH=arm64

echo -e "$red // defconfig is set to $KERNEL_DEFCONFIG //"
echo -e "$red***********************************************"
echo -e "$R BUILDING KERNEL "
echo -e "***********************************************$nocol"

make $KERNEL_DEFCONFIG O=out
make -j$JOBS CC=$CLANG_TOOLCHAIN CLANG_TRIPLE=aarch64-linux-gnu- O=out
