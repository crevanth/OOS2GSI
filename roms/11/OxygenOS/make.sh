#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rsync -ra $thispath/system/ $systempath

# Featurelist patching
# sed -i "s/\[97\]\ UnKnown\ =\ true/\[97\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[235\]\ UnKnown\ =\ true/\[235\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[349\]\ UnKnown\ =\ true/\[349\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[292\]\ UnKnown\ =\ true/\[292\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[293\]\ UnKnown\ =\ true/\[293\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[282\]\ UnKnown\ =\ false/\[282\]\ UnKnown\ =\ true/g" $1/etc/odm_feature_list
sed -i "s/\[319\]\ UnKnown\ =\ true/\[319\]\ UnKnown\ =\ false/g" $1/etc/odm_feature_list
sed -i "s/\[56\]\ UnKnown\ =\ false/\[56\]\ UnKnown\ =\ true/g" $1/etc/odm_feature_list

# Drop Iris in Manifests
sed -i "s/vendor.pixelworks.hardware.display/vendor.irisgay.hardware.display/g" $1/etc/vintf/*.xml
sed -i "s/vendor.pixelworks.hardware.feature/vendor.irisgay.hardware.feature/g" $1/etc/vintf/*.xml

# Shut up bitch
rm -rf $1/system_ext/app/OPBackup

# stfu
echo "ro.vendor.display.svi=0" >> $1/product/build.prop
echo "ro.vendor.display.svi=0" >> $1/etc/prop.default
echo "ro.vendor.display.svi=0" >> $1/system_ext/build.prop
echo "persist.vendor.fps.force.disable=true" >> $1/product/build.prop
echo "persist.vendor.fps.force.disable=true" >> $1/etc/prop.default
echo "persist.vendor.fps.force.disable=true" >> $1/system_ext/build.prop

## Fix OOS Data, kang from flyme fix Permission
chmod 0644 $1/etc/init/flymedata.rc

# append extra rw-system.sh
cat $thispath/rw-system.add.sh >> $1/bin/rw-system.sh

# Remove system DPI definitions
sed -i "/ro.sf.lcd_density/d" $1/build.prop 
sed -i "/ro.sf.lcd_density/d" $1/product/build.prop 
sed -i "/ro.sf.lcd_density/d" $1/system_ext/build.prop 
sed -i "/ro.sf.lcd_density/d" $1/etc/prop.default