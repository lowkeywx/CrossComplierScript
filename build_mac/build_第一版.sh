#!/bin/bash

BUILD_TYPE=Release
TOP_DIR=`pwd`

#SOURCE_NAMES="abseil-cpp-20200923 libyuv libuv-1.40.0 protobuf-3.3.0 webrtcAudioProcess opus-1.2-rc1 openssl"
SOURCE_NAMES="openssl"

echo "====================================mac-${SOURCE_NAMES}======================================"
for SRC_NAME in ${SOURCE_NAMES}
do
    INSTALL_PATH=${TOP_DIR}/${SRC_NAME}
    TEMP_DIR=${TOP_DIR}/temp/${SRC_NAME}
    SOURCE_DIR=${TOP_DIR}/../${SRC_NAME}
    #如果是protobuf需要重设cmake路径
    if [ "$SRC_NAME" = "protobuf-3.3.0" ]; then
        SOURCE_DIR=${SOURCE_DIR}/cmake
    fi
    #创建并且进入临时目录
    mkdir -p ${TEMP_DIR}
    cd ${TEMP_DIR}
    #开始编译
    if [ "$SRC_NAME" = "opus-1.2-rc1" ]; then
        ${SOURCE_DIR}/configure --enable-float-approx --disable-shared --enable-static --with-pic --disable-extra-programs --disable-doc \
        --prefix=${INSTALL_PATH} \

        make -j4
        make install
    elif [ "$SRC_NAME" = "openssl" ]; then
        ${SOURCE_DIR}/configure --prefix=${INSTALL_PATH} \
        make -j 3
        make install
    else
        cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
                -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}   \
                ${SOURCE_DIR}
        cmake --build . --config ${BUILD_TYPE} --target install -j 3
    fi
    cd ${TOP_DIR}
done
