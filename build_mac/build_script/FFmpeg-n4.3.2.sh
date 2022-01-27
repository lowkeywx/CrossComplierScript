#!/bin/bash

CFLAGS="-fvisibility=hidden -fembed-bitcode"

export PKG_CONFIG_PATH="${BS_TOP_DIR}/install/x264-master/lib/pkgconfig/"

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--extra-cflags="$CFLAGS" \
--disable-debug \
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
--disable-doc \
--enable-pic \
--enable-gpl \
--enable-libx264 \

make -j4
make install