#!/bin/bash

export PKG_CONFIG_PATH="${BS_TOP_DIR}/install/x264-master/lib/pkgconfig/"

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--pkg-config=/usr/bin/pkg-config \
--enable-static \
--enable-libx264 \
--enable-gpl \
--enable-pic \
--disable-programs \
--disable-doc \
--disable-asm \
--disable-inline-asm \
--disable-nvdec \
--disable-nvenc \

make -j4
make install