#/bin/bash

export MACOSX_DEPLOYMENT_TARGET=10.12

SCRIPT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"

#SOURCE="${SCRIPT_DIR}/../ffmpeg-n4.2.4"
SOURCE="${SCRIPT_DIR}/../FFmpeg-n4.3.2"
OUTPUT=$SCRIPT_DIR/ffmpeg-macos
TEMP_DIR="temp"
mkdir $OUTPUT
mkdir ${TEMP_DIR}

# absolute path to x264 library
X264=${SCRIPT_DIR}/../x264-mac-build/x264-macos

CONFIGURE_FLAGS="--disable-debug \
				--enable-static \
				--disable-programs \
				--disable-symver \
				--disable-htmlpages \
				--disable-manpages \
				--disable-podpages \
				--disable-cuda \
				--disable-cuvid \
				--disable-nvenc \
				--disable-lzma \
                --disable-doc --enable-pic"

if [ "$X264" ]
then
	echo "================================ENABLE-X264=============================================="
	echo $X264
	CONFIGURE_FLAGS="$CONFIGURE_FLAGS --enable-gpl --enable-libx264"
fi

CFLAGS="-fvisibility=hidden -fembed-bitcode"
LDFLAGS=""

if [ "$X264" ]
then
	CFLAGS="$CFLAGS -I$X264/include"
	LDFLAGS="$LDFLAGS -L$X264/lib"
fi

cd ${TEMP_DIR}
${SOURCE}/configure $CONFIGURE_FLAGS --extra-cflags="$CFLAGS" --extra-ldflags="$LDFLAGS"  --prefix=$OUTPUT

make -j3

make install || exit 1