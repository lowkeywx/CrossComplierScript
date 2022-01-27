#!/bin/bash

LIPO=ON
#BUILD=ON

SDKVERSION="14.0"
MINIOSVERSION="8.0"

SOURCE_NAMES=libuuid-1.0.3

ARCHS="i386 x86_64 armv7 armv7s arm64"
DEVELOPER=`xcode-select -print-path`

TOP_DIR=`pwd`
#编译
if [ "$BUILD" ]
then
    for SRC_NAME in ${SOURCE_NAMES}
    do
        for ARCH in ${ARCHS}
        do
            if [ "${ARCH}" == "i386" ] || [ "${ARCH}" == "x86_64" ]; then
                PLATFORM="iPhoneSimulator"
                EXTRA_CFLAGS="-arch ${ARCH}"
                EXTRA_CONFIG="--host=x86_64-apple-darwin"
            else
                PLATFORM="iPhoneOS"
                EXTRA_CFLAGS="-arch ${ARCH}"
                EXTRA_CONFIG="--host=arm-apple-darwin"
            fi

            INSTALL_PATH=${TOP_DIR}/configure_build/${PLATFORM}/${ARCH}/${SRC_NAME}
            TEMP_DIR=${TOP_DIR}/temp/configure_build/${PLATFORM}/${ARCH}/${SRC_NAME}
            SOURCE_DIR=${TOP_DIR}/../${SRC_NAME}

            mkdir -p ${TEMP_DIR}
            cd ${TEMP_DIR}

            ${SOURCE_DIR}/configure ${EXTRA_CONFIG} \
            --prefix="${INSTALL_PATH}" \
            LDFLAGS="$LDFLAGS ${OPT_LDFLAGS} -fPIE -miphoneos-version-min=${MINIOSVERSION} -L${INSTALL_PATH}/lib" \
            CFLAGS="$CFLAGS ${EXTRA_CFLAGS} ${OPT_CFLAGS} -fPIE -miphoneos-version-min=${MINIOSVERSION} -I${INSTALL_PATH}/include -isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk" \

            # Build the application and install it to the fake SDK intermediary dir
            # we have set up. Make sure to clean up afterward because we will re-use
            # this source tree to cross-compile other targets.
            make -j4
            make install
            make clean
        done
    done
fi
#生成fat文件
if [ "$LIPO" ]
then
    cd ${TOP_DIR}
    rm -rf temp
    FAT_DIR=${TOP_DIR}/Fat
    mkdir -p ${FAT_DIR}
    for SRC_NAME in ${SOURCE_NAMES}
    do
        LIB_PATH=${TOP_DIR}/configure_build/iPhoneSimulator/i386/${SRC_NAME}/lib
        echo ${LIB_PATH}
        for lib in ${LIB_PATH}/*.a
        do
            file=`basename ${lib}`
            echo ${file}
            libs=`find ${TOP_DIR} -name ${file}`
            lipo -create ${libs} -output ${FAT_DIR}/${file}
        done
    done
fi