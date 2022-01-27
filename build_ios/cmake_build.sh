#!/bin/bash

BUILD_TYPE=Release
TOP_DIR=`pwd`
TOOLCHAIN_FILE=${TOP_DIR}/ios-cmake/ios.toolchain.cmake
#LIPO=ON
BUILD=ON
#OS OS64 SIMULATOR SIMULATOR64
#TARGET_PLATFORMS="OS SIMULATOR SIMULATOR64"
TARGET_PLATFORMS="SIMULATOR64"

#armv7 armv7s armv7k arm64 arm64_32 i386 x86_64,系统会根据platform推测,不需要设置
#TARGET_ARCHS=armv7

#SOURCE_NAMES="abseil-cpp-20200923 libyuv libuv-1.40.0 protobuf-3.3.0 webrtcAudioProcess"
SOURCE_NAMES="webrtcAudioProcess"

#编译命令,如果编译webrecAudio需要删除--target install
#cmake --build . --config ${BUILD_TYPE} --target install -j 3

if [ "$BUILD" ]
then
    for OS in ${TARGET_PLATFORMS}
    do
        echo "====================================${OS}======================================"
        for SRC_NAME in ${SOURCE_NAMES}
        do
            INSTALL_PATH=${TOP_DIR}/${OS}/${SRC_NAME}
            TEMP_DIR=${TOP_DIR}/temp/${OS}/${SRC_NAME}
            SOURCE_DIR=${TOP_DIR}/../${SRC_NAME}

            if [ "$SRC_NAME" = "protobuf-3.3.0" ]; then
                SOURCE_DIR=${SOURCE_DIR}/cmake
            fi
            mkdir -p ${TEMP_DIR}
            cd ${TEMP_DIR}
            cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
                    -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}   \
                    -G Xcode \
                    -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE} \
                    -DPLATFORM=${OS} \
                    ${SOURCE_DIR}
            cmake --build . --config ${BUILD_TYPE} --target install -j 3
            cd ${TOP_DIR}
        done
    done
fi

if [ "$LIPO" ]
then
    cd ${TOP_DIR}
    rm -rf temp
    FAT_DIR=${TOP_DIR}/Fat
    mkdir -p ${FAT_DIR}
    for SRC_NAME in ${SOURCE_NAMES}
    do
        LIB_PATH=${TOP_DIR}/OS/${SRC_NAME}/lib
        for lib in ${LIB_PATH}/*.a
        do
            file=`basename ${lib}`
            echo ${file}
            libs=`find ${TOP_DIR} -name ${file}`
            lipo -create ${libs} -output ${FAT_DIR}/${file}
        done
    done
fi



