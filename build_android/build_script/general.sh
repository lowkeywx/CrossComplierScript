#!/bin/bash
        
cmake -G"Unix Makefiles" \
    ${BS_CMAKE_SHARE_ARGUMENTS} \
    -DANDROID_ARM_NEON=TRUE \
    ${BS_SOURCE_DIR}

make -j 3
make install
