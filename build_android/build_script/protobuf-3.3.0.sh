#!/bin/bash
        
cmake -G"Unix Makefiles" \
    ${BS_CMAKE_SHARE_ARGUMENTS} \
    -DANDROID_ARM_NEON=TRUE \
    -Dprotobuf_BUILD_TESTS=FALES \
    -Dprotobuf_BUILD_EXAMPLES=NO \
    ${BS_SOURCE_DIR}/cmake

make -j 3
make install
