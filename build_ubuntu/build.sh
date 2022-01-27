#!/bin/bash

export BS_BUILD_TYPE=Release
export BS_TOP_DIR=`pwd`
export BS_BUILD_SCRIPT_DIR="${BS_TOP_DIR}/build_script"

#SOURCE_NAMES="abseil-cpp-20200923 libyuv libuv-1.40.0 protobuf-3.3.0 webrtcAudioProcess opus-1.2-rc1 openssl-1.1.1h c-ares curl-7.73.0 x264-mater FFmpeg-n4.2.4"
SOURCE_NAMES="FFmpeg-n4.3.2"

for SRC_NAME in ${SOURCE_NAMES}
do
echo "====================================ubuntu-${SRC_NAME}======================================"
    export BS_INSTALL_PATH=${BS_TOP_DIR}/install/${SRC_NAME}
    export BS_TEMP_DIR=${BS_TOP_DIR}/temp/${SRC_NAME}
    export BS_SOURCE_DIR=${BS_TOP_DIR}/../${SRC_NAME}
    #设置CMake和Configure通用的编译选项
    export BS_CMAKE_SHARE_ARGUMENTS="-DCMAKE_BUILD_TYPE=${BS_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=${BS_INSTALL_PATH}"
    export BS_CONFIGURE_SHARE_ARGUMENTS="--prefix=${BS_INSTALL_PATH}"
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
    if [ -a "${BS_BUILD_SCRIPT_DIR}/${SRC_NAME}.sh" ]; then
        source ${BS_BUILD_SCRIPT_DIR}/${SRC_NAME}.sh
    else
        source ${BS_BUILD_SCRIPT_DIR}/general.sh
    fi

    cd ${BS_TOP_DIR}
    echo "编译结束==================================="
done
