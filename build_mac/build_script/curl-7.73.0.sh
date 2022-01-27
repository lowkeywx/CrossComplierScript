#!/bin/bash

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--with-secure-transport \
--without-libidn2 \
--without-librtmp \
--disable-ldap \
--without-libpsl \
--disable-shared \
--enable-static \
--without-ssl \
--enable-symbol-hiding \
--enable-ares=${BS_TOP_DIR}/install/c-ares

make -j4
make install