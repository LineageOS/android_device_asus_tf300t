#!/bin/sh

BASE=../../../vendor/asus/tf300t/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
done

adb pull /system/lib/hw/camera.tegra.so $BASE/lib/hw/camera.vendor.tegra.so

./setup-makefiles.sh

