#/bin/bash

export MACOSX_DEPLOYMENT_TARGET=10.12

SCRIPT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"

SOURCE_PATH="${SCRIPT_DIR}/../x264-master"

CONFIGURE_FLAGS="--enable-static --enable-pic --disable-cli"
Output="$SCRIPT_DIR/x264-macos"
mkdir -p $Output

CFLAGS="-arch x86_64 -fvisibility=hidden  -fembed-bitcode"

echo "==========================install path $Output===================================="

mkdir "temp"
cd "temp"

${SOURCE_PATH}/configure $CONFIGURE_FLAGS  --prefix=$Output --extra-cflags="$CFLAGS"

make -j `nproc`
make install
