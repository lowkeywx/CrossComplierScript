#!/bin/bash

LIPO=ON
#BUILD=ON

SDKVERSION="14.0"
MINIOSVERSION="8.0"

#SOURCE_NAMES=libuuid-1.0.3 c-ares
SOURCE_NAMES=curl-7.73.0

#ARCHS="i386 x86_64 armv7 armv7s arm64"
ARCHS="i386"
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

            export CONFIG_OPTS="${EXTRA_CONFIG}"
             export DEVPATH=`xcode-select -print-path`/Platforms/${PLATFORM}.platform/Developer
             export IOSFLAGS="-isysroot $DEVPATH/SDKs/${PLATFORM}.sdk -arch ${ARCH} -miphoneos-version-min=8.0.0"
             export CFLAGS=$IOSFLAGS
             export CXXFLAGS=$IOSFLAGS
             export LDFLAGS=$IOSFLAGS

            ${SOURCE_DIR}/configure --enable-ares=${TOP_DIR}/configure_build/${PLATFORM}/${ARCH}/c-ares \
            --with-secure-transport \
	        --without-libidn2 \
	        --without-librtmp \
	        --disable-ldap \
	        --without-libpsl \
	        --disable-shared \
	        --enable-static \
            --without-ssl \
	        --enable-symbol-hiding \
            ${CONFIG_OPTS} \
            --prefix="${INSTALL_PATH}"

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