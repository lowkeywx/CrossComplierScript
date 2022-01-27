#!/bin/bash

cmake -G"Unix Makefiles" \
    -DANDROID_ARM_NEON=TRUE \
    -DENABLE_ARES=ON \
    -DCARES_LIBRARY=${top}/${ANDROID_ARCH_ABI}/c-ares/lib \
    -DCARES_INCLUDE_DIR=${top}/${ANDROID_ARCH_ABI}/c-ares/include \
    -DOPENSSL_CRYPTO_LIBRARY=${top}/${ANDROID_ARCH_ABI}/openssl/lib/libcrypto.a \
    -DOPENSSL_INCLUDE_DIR==${top}/${ANDROID_ARCH_ABI}/openssl/include \
    ${SOURCE_PATH}

make -j 3
make install
