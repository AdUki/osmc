# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

echo -e "Building package rbp-bootloader-osmc"

BOOT="files/boot"
FWFILES=( "LICENCE.broadcom" "start_x.elf" "fixup_x.dat" "bootcode.bin" )
REV="960832a6c2590635216c296b6ee0bebf67b21d50"

make clean

mkdir -p "${BOOT}"

for file in ${FWFILES[@]}
do
    pull_bin "https://raw.githubusercontent.com/raspberrypi/firmware/${REV}/boot/${file}" "${BOOT}/${file}"
done

dpkg_build files/ rbp-bootloader-osmc.deb
