#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Disable setup wizard
echo "DEVICE_PROVISIONED=1" >> $1/build.prop

# FOD
echo "ro.hardware.fp.fod=true" >> $1/build.prop
echo "persist.vendor.sys.fp.fod.location.X_Y=445,1260" >> $1/build.prop
echo "persist.vendor.sys.fp.fod.size.width_height=190,190" >> $1/build.prop
sed -i "/miui.notch/d" $1/build.prop

# drop nfc
rm -rf $1/system_ext/app/NQNfcNci

# round cockners
sed -i 's/<bool name="support_round_corner">true/<bool name="support_round_corner">false/' $1/etc/device_features/*
