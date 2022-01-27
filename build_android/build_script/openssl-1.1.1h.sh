#!/bin/bash

export ANDROID_NDK_HOME=${BS_NDK_PATH}

if [ "$ANDROID_ARCH_ABI" = "arm64-v8a" ]; then
    ARCH=android-arm64
elif [ "$ANDROID_ARCH_ABI" = "armeabi-v7a" ]; then
    ARCH=android-arm
elif [ "$ANDROID_ARCH_ABI" = "x86" ]; then
    ARCH=android-x86
else
    ARCH=android-x86_64
fi


${BS_SOURCE_DIR}/Configure ${ARCH} -D__ANDROID_API__=${BS_API_LEVEL}

make -j4
make install
