#!/bin/bash

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--enable-float-approx \
--disable-shared \
--enable-static \
--with-pic \
--disable-extra-programs \
--disable-doc \

make -j4
make install
make clear
