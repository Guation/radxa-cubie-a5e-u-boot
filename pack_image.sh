#!/bin/bash
dd if=/dev/zero of=radxa-cubie-a5e-u-boot.img bs=1M count=16 status=progress
dd conv=notrunc,fsync if=u-boot-aw2501/out/radxa-cubie-a5e/boot0_sdcard.bin of=radxa-cubie-a5e-u-boot.img bs=512 seek=256
dd conv=notrunc,fsync if=u-boot-aw2501/out/radxa-cubie-a5e/boot_package.fex of=radxa-cubie-a5e-u-boot.img bs=512 seek=24576
sync
