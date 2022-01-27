export BS_TOP_DIR=`pwd`
export BS_BUILD_TYPE=Release
export BS_BUILD_SCRIPT_DIR="${BS_TOP_DIR}/build_script"
export BS_NDK_PATH=/Users/tosee/Library/Android/sdk/ndk/21.0.6113669
export BS_API_LEVEL=19

ARCHS="armeabi-v7a arm64-v8a x86 x86_64"
SOURCE_NAMES="abseil-cpp-20200923 libyuv libuv-1.40.0 protobuf-3.3.0 libuuid-1.0.3 c-ares libwebrtc_android"
for ANDROID_ARCH_ABI in ${ARCHS}
do
    for SRC_NAME in libwebrtc_android
    do
        echo "====================================android-${SRC_NAME}-${ANDROID_ARCH_ABI}======================================"
        #设置安装路径 中间目录 源码目录
        export BS_INSTALL_PATH=${BS_TOP_DIR}/install/${ANDROID_ARCH_ABI}/${SRC_NAME}
        export BS_TEMP_DIR=${BS_TOP_DIR}/temp/${ANDROID_ARCH_ABI}/${SRC_NAME}
        export BS_SOURCE_DIR=${BS_TOP_DIR}/../${SRC_NAME}
        #设置CMake和Configure通用的编译选项
        export BS_CMAKE_SHARE_ARGUMENTS="-DANDROID_NDK=${BS_NDK_PATH} \
                                        -DCMAKE_TOOLCHAIN_FILE=${BS_NDK_PATH}/build/cmake/android.toolchain.cmake \
                                        -DANDROID_ABI=${ANDROID_ARCH_ABI} \
                                        -DANDROID_NATIVE_API_LEVE=${BS_API_LEVEL} \
                                        -DANDROID_PLATFORM=${BS_API_LEVEL} \
                                        -DCMAKE_INSTALL_PREFIX=${BS_INSTALL_PATH} \
                                        -DCMAKE_BUILD_TYPE=${BS_BUILD_TYPE}"
        #创建并且进入临时目录
        echo "清理且进入临时目录： ${BS_TEMP_DIR}"
        rm -rf ${BS_TEMP_DIR}
        mkdir -p ${BS_TEMP_DIR}
        cd ${BS_TEMP_DIR}
        #下面这句代码可能没有意义, 之后可以测试一下, 没影响就删除掉
        export PATH=`pwd`:$PATH
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
        echo "编译结束==================================="
    done
done
