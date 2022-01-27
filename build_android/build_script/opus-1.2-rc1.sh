
#!/bin/bash
        
${BS_SOURCE_DIR}/configure \
    ${BS_CONFIGURE_SHARE_ARGUMENTS} \
    --disable-shared \
    --enable-static \
    --disable-extra-programs \
    --disable-stack-protector \
    --extra-cflags=="-g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong"

make -j 3
make install
