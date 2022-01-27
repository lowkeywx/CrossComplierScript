#!/usr/bin/env bash

build_x264 () {
    #创建并进入中间目录
    TEMP_DIR="./temp/$TARGET_OS"
    if [ ! -d "$TEMP_DIR" ]; then
        mkdir -p "$TEMP_DIR"
    fi
    cd $TEMP_DIR
    echo `pwd`
    #开始生成
  CC=cl $PRE_DIR/../$SOURCE_DIR/configure --prefix=$INSTALL_DIR --enable-static

    make -j8
    make install
    cd $PRE_DIR
}

SOURCE_DIR="x264-master"
TARGET_OS="x86"
PRE_DIR=`pwd`
INSTALL_DIR="$PRE_DIR/install/$TARGET_OS"
echo $INSTALL_DIR
build_x264
