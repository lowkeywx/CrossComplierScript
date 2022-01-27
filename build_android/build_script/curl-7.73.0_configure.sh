#!/bin/bash
        
${BS_SOURCE_DIR}/configure \
    ${BS_CONFIGURE_SHARE_ARGUMENTS} \
    --enable-ares=${BS_TOP_DIR}/install/${ANDROID_ARCH_ABI}/c-ares \
    --with-ssl=${BS_TOP_DIR}/install/${ANDROID_ARCH_ABI}/openssl

make -j 3
make install