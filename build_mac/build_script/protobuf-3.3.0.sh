#!/bin/bash

cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        ${BS_CMAKE_SHARE_ARGUMENTS} \
        ${BS_SOURCE_DIR}/cmake
        
cmake --build . --config ${BS_BUILD_TYPE} --target install 
