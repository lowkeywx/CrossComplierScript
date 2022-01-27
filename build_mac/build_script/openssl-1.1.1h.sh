#!/bin/bash

${BS_SOURCE_DIR}/config \
${BS_CONFIGURE_SHARE_ARGUMENTS} \

make -j4
make test
make install
