#!/bin/bash

NDK=/Users/duobei/Work/android-ndk-r21b
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
export API=21

X264_PATH=/Users/duobei/Work/x264-master

function build_one
{
TOP=`pwd`
TEMP_PATH=./temp/NDK$API/$kind
mkdir -p ${TEMP_PATH}
cd ${TEMP_PATH}
echo 'start' $kind
${X264_PATH}/configure \
    --prefix=${TOP}/install/NDK$API/$kind \
    --enable-static \
    --enable-pic \
    --host=$my_host \
    --sysroot=$TOOLCHAIN/sysroot \

make clean
make
make install
cd ${TOP}
echo 'end' $kind
}

export TARGET=x86_64-linux-android
export AR=$TOOLCHAIN/bin/$TARGET-ar
#export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
kind=x64
my_host=$TARGET
#build_one

export TARGET=i686-linux-android
export AR=$TOOLCHAIN/bin/$TARGET-ar
#export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
kind=x86
my_host=$TARGET
#x86构架需要添加--disable-asm编译选项
build_one

export TARGET=aarch64-linux-android
export AR=$TOOLCHAIN/bin/$TARGET-ar
#export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
kind=aarch64
my_host=$TARGET
#build_one


export TARGET=arm-linux-androideabi
export AR=$TOOLCHAIN/bin/$TARGET-ar
#export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
export CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
kind=armv7a
my_host=$TARGET
#build_one

