#!/bin/bash

${BS_SOURCE_DIR}/configure \
${BS_CONFIGURE_SHARE_ARGUMENTS} \
--with-ssl=${BS_TOP_DIR}/install/openssl-1.1.1h \
--enable-ares=${BS_TOP_DIR}/install/c-ares \

make -j4
make install