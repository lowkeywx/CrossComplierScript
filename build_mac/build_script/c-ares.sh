#!/bin/bash

cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        ${BS_CMAKE_SHARE_ARGUMENTS} \
        -DCARES_STATIC=ON \
        -DCARES_SHARED=OFF \
        ${BS_SOURCE_DIR}

cmake --build . --config ${BS_BUILD_TYPE} --target install 
