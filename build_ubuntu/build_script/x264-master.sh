#!/bin/bash

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--enable-static \
--disable-asm \
--enable-pic \


make -j4
make install