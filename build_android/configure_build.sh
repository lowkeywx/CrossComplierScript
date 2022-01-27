#!/bin/bash

export BS_TOP_DIR=`pwd`
export BS_BUILD_TYPE=Release
export BS_BUILD_SCRIPT_DIR="${BS_TOP_DIR}/build_script"
export BS_NDK_PATH=/Users/duobei/Work/android-ndk-r21b
export BS_API_LEVEL=19
export BS_TOOL_CHAINS_PATH=${BS_NDK_PATH}/toolchains/llvm/prebuilt/darwin-x86_64
export BS_NDK_SYSROOT=${BS_TOOL_CHAINS_PATH}/sysroot

export PATH=${BS_TOOL_CHAINS_PATH}/bin:$PATH
export C_INCLUDE_PATH=${NDK_SYSROOT}/usr/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=${NDK_SYSROOT}:$CPLUS_INCLUDE_PATH
#build目录
ALL_HOST="aarch64-linux-android arm-linux-androideabi i686-linux-android x86_64-linux-android"
ARCHS="armeabi-v7a arm64-v8a x86 x86_64"
SOURCE_NAMES="openssl-1.1.1h"

top=`pwd`
rm -rf temp
#for ANDROID_ARCH_ABI in armeabi-v7a arm64-v8a x86 x86_64
for ANDROID_ARCH_ABI in armeabi-v7a
do
    if [ "$ANDROID_ARCH_ABI" = "arm64-v8a" ]; then
        HOST=aarch64-linux-android
    elif [ "$ANDROID_ARCH_ABI" = "armeabi-v7a" ]; then
        HOST=arm-linux-androideabi
    elif [ "$ANDROID_ARCH_ABI" = "x86" ]; then
        HOST=i686-linux-android
    else
        HOST=x86_64-linux-android
    fi
    HOST_CC=${HOST}${BS_API_LEVEL}-clang
    if [ "$ANDROID_ARCH_ABI" = "armeabi-v7a" ]; then
        HOST_CC=armv7a-linux-androideabi${BS_API_LEVEL}-clang
    fi
    export C_INCLUDE_PATH=${NDK_SYSROOT}/usr/include/${HOST}:$C_INCLUDE_PATH
    for LIB_NAME in ${SOURCE_NAMES}
    do
        #设置安装路径 中间目录 源码目录
        export BS_INSTALL_PATH=${BS_TOP_DIR}/install/${ANDROID_ARCH_ABI}/${LIB_NAME}
        export BS_TEMP_DIR=${BS_TOP_DIR}/temp/${ANDROID_ARCH_ABI}/${LIB_NAME}
        export BS_SOURCE_DIR=${BS_TOP_DIR}/../${LIB_NAME}
        export ANDROID_ARCH_ABI

        export CC=${BS_TOOL_CHAINS_PATH}/bin/${HOST_CC}
        #设置CMake和Configure通用的编译选项
        export BS_CONFIGURE_SHARE_ARGUMENTS="--prefix=${BS_INSTALL_PATH} --host=${HOST} --with-sysroot=${BS_NDK_SYSROOT}"
        #创建并且进入临时目录
        echo "清理且进入临时目录： ${BS_TEMP_DIR}"
        rm -rf ${BS_TEMP_DIR}
        mkdir -p ${BS_TEMP_DIR}
        cd ${BS_TEMP_DIR}
        #开始编译
        echo "当前目录： `pwd`"
        echo "源码目录：${BS_SOURCE_DIR}"
        echo "安装目录：${BS_INSTALL_PATH}"
        echo "编译开始==================================="
        if [ -a "${BS_BUILD_SCRIPT_DIR}/${LIB_NAME}.sh" ]; then
            source ${BS_BUILD_SCRIPT_DIR}/${LIB_NAME}.sh
        else
            source ${BS_BUILD_SCRIPT_DIR}/general.sh
        fi
        echo "编译结束==================================="
    done
done
