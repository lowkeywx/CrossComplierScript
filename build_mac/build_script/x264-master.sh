#!/bin/bash

CFLAGS="-arch x86_64 -fvisibility=hidden  -fembed-bitcode"

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--enable-static \
--enable-pic \
--disable-cli \
--extra-cflags="$CFLAGS" \

make -j4
make install