#!/bin/bash
NDK=/Users/duobei/Work/android-ndk-r21b
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
SYSROOT=$TOOLCHAIN/sysroot
FF_CFLAGS="-U_FILE_OFFSET_BITS -O3 -pipe -Wall -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wa,--noexecstack -DANDROID -DBIONIC_IOCTL_NO_SIGNEDNESS_OVERLOAD"
FF_CONFIGURE_FLAGS="--enable-static  --enable-pic --enable-postproc --disable-stripping"
FF_EXTRA_CONFIGURE_FLAGS="${EXTRA_CONFIGURE_FLAGS} --extra-libs=-ldl"
ADDI_LDFLAGS=""
FFMPEG_PATH=`pwd`/../FFmpeg-n4.3.2
X264_Path=`pwd`/../x264-android-build/install

function build_android
{
echo "Compiling FFmpeg for $CPU"
TOP=`pwd`
TEMP_DIR=${TOP}/temp/NDK${API}/${ARCH}
mkdir -p ${TEMP_DIR}
cd ${TEMP_DIR}
PKG_CONFIG_PATH=$PKG_CONFIG_PATH ${FFMPEG_PATH}/configure \
    --prefix=$PREFIX \
    --cross-prefix=$CROSS_PREFIX \
    --pkg-config=/usr/local/bin/pkg-config \
    --target-os=android \
    --arch=$ARCH \
    --cpu=$CPU \
    --cc=$CC \
    --cxx=$CXX \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --disable-runtime-cpudetect \
    --disable-hwaccels \
    --disable-gpl \
    --disable-postproc \
    --disable-decoder=h264_mediacodec \
    --disable-programs \
    --disable-avdevice \
    --disable-doc \
    --disable-debug \
    --disable-symver \
    --disable-lzma \
	--disable-sndio \
	--disable-v4l2-m2m \
    --disable-outdev=v4l2 \
    --disable-outdev=fbdev \
	--disable-htmlpages \
    --disable-manpages \
    --disable-podpages \
    --disable-txtpages \
    --disable-schannel \
	--disable-avdevice \
	--disable-securetransport \
    --disable-xlib \
    --disable-cuda \
    --disable-cuvid \
    --disable-nvenc \
    --disable-vaapi \
    --disable-vdpau \
    --disable-videotoolbox \
    --disable-audiotoolbox \
    --disable-appkit \
    --disable-alsa \
	--disable-muxers \
	--disable-demuxers \
	--disable-encoders \
	--disable-decoders \
	--disable-parsers \
	--disable-filters \
    --disable-x86asm \
    --enable-jni \
    --enable-mediacodec \
    --enable-gpl \
	--enable-libx264 \
	--enable-encoder=libx264,h264* \
	--enable-decoder=flv,h264* \
    --enable-parser=h264 \
    --enable-filter=*fade,*fifo,*format,*resample,aeval,all*,atempo,color*,convolution,draw*,eq*,framerate,*_cuda,*v4l2*,hw*,null,scale,volume \
    $FF_CONFIGURE_FLAGS \
	$FF_EXTRA_CONFIGURE_FLAGS \
    --extra-cflags="-Os $OPTIMIZE_CFLAGS $FF_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS $FF_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG

make clean
make -j 3
make install
cd ${TOP}
echo "The Compilation of FFmpeg for $CPU is completed"
}

#armv8-a
ARCH=arm64
CPU=armv8-a
API=21
CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-
PREFIX=$(pwd)/android/NDK$API/$CPU
OPTIMIZE_CFLAGS="-march=$CPU"
PKG_CONFIG_PATH="${X264_Path}/NDK$API/aarch64/lib/pkgconfig/"
#build_android

#armv7-a
#x264pc这个文件要注意
ARCH=arm
CPU=armv7-a
API=19
CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-
PREFIX=$(pwd)/android/NDK$API/$CPU
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU "
PKG_CONFIG_PATH="${X264_Path}/NDK$API/armv7a/lib/pkgconfig/"
#build_android

#x86
#x86需要添加 --disable-asm 编译选项
ARCH=x86
CPU=x86
API=21
CC=$TOOLCHAIN/bin/i686-linux-android$API-clang
CXX=$TOOLCHAIN/bin/i686-linux-android$API-clang++
CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android-
PREFIX=$(pwd)/android/NDK$API/$CPU
OPTIMIZE_CFLAGS="-march=i686 -mtune=intel -mssse3 -mfpmath=sse -m32"
PKG_CONFIG_PATH="${X264_Path}/NDK$API/x86/lib/pkgconfig/"
#build_android

#x86_64
ARCH=x86_64ls
CPU=x86-64
API=21
CC=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++
CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-
PREFIX=$(pwd)/android/NDK$API/$CPU
OPTIMIZE_CFLAGS="-march=$CPU -msse4.2 -mpopcnt -m64 -mtune=intel"
PKG_CONFIG_PATH="${X264_Path}/NDK$API/x64/lib/pkgconfig/"
build_android