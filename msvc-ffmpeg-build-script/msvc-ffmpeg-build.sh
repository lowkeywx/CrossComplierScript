#!/usr/bin/env bash

build_ffmpeg () {
    #创建并进入中间目录
    TEMP_DIR="./temp/$ARCH"
    if [ ! -d "$TEMP_DIR" ]; then
        mkdir -p "$TEMP_DIR"
    fi
    cd $TEMP_DIR
    PKG_CONFIG_PATH="/C/DuoBei/msvc-x264-build-script/install/$ARCH/lib/pkgconfig/"
    
    #开始生成
    $PRE_DIR/../$SOURCE_DIR/configure \
    --prefix=$INSTALL_DIR \
    --arch=$ARCH \
    --toolchain=msvc \
    --pkg-config=/usr/bin/pkg-config \
    --enable-static \
    --enable-libx264 \
    --enable-gpl \
    --disable-programs \
    --disable-doc \

    make -j8
    make install
    cd $PRE_DIR
}

SOURCE_DIR="FFmpeg-n4.3.2"
ARCH="x86"
#ARCH="x86_64"
PRE_DIR=`pwd`
INSTALL_DIR="$PRE_DIR/install/$ARCH"
build_ffmpeg