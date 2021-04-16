#!/bin/bash
#Written By @nnippon!, thanks for tools for help me make it ez

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
extractor="$LOCALDIR/tools/Firmware_extractor/extractor.sh"
working="$LOCALDIR/work"
outdir="$LOCALDIR/cache"

echo "Ensure everything is fine for start . . . . "
	rm -rf $outdir $working
	bash update.sh

echo "Creating folders to start process . . . . "
	mkdir -p "$outdir" "$working"

echo "Extracting ROM zip . . . . "
	bash $extractor $1 $outdir
	mv $outdir/system.img $outdir/system-old.img

echo "Creating 6GB empty image . . . . "
dd if=/dev/zero of=system.img bs=6k count=1048576
mkfs.ext4 system.img
tune2fs -c0 -i0 system.img

echo "Merging system . . . . "
	mkdir $outdir/system-old
	mount -o loop system.img $working
	mount -o ro $outdir/system-old.img $outdir/system-old
	cp -v -r -p $outdir/system-old/* $working/ &> /dev/null
	sync
	umount -l $outdir/system-old

if [ -f "$outdir/product.img" ]; then
echo "Merging product . . . . "
	rm -rf $working/product
	ln -s $working/product $working/product
	rm -rf $working/system/product
	mkdir $working/system/product
	mkdir $outdir/product
	mount -o ro $outdir/product.img $outdir/product
	cp -v -r -p $outdir/product/* $working/system/product/ &> /dev/null
	sync
	umount -l $outdir/product
fi

if [ -f "$outdir/system_ext.img" ]; then
echo "Merging system_ext . . . . "
	mkdir $outdir/system_ext
	mount -o ro $outdir/system_ext.img $outdir/system_ext/
	rm -rf $working/system_ext
	rm -rf $working/system/system_ext
	mkdir $working/system/system_ext
	ln -s $working/system_ext $working/system_ext
	cp -v -r -p $outdir/system_ext/* $working/system/system_ext/ &> /dev/n$
	sync
	umount -l $outdir/system_ext
fi

if [ -f "$outdir/system_other.img" ]; then
	echo "Merging system_other . . . . "
	mkdir $outdir/system_other
	mount -o ro $outdir/system_other.img $outdir/system_other/
	cp -v -r -p $outdir/system_other/* $working/system/ &> /dev/null
	sync
	umount -l $outdir/system_other
fi

if [ -f "$outdir/opproduct.img" ]; then
	echo "Merging opproduct . . . . "
	mkdir $outdir/opproduct
	mount -o ro $outdir/opproduct.img $outdir/opproduct/
	cp -v -r -p $outdir/opproduct/* $working/oneplus/ &> /dev/null
	sync
	umount -l $outdir/opproduct
fi

if [ -f "$outdir/reserve.img" ]; then
	echo "Merging reserve . . . . "
	rm -rf $working/system/reserve
	mkdir $working/system/reserve
	mkdir $outdir/reserve
	mount -o ro $outdir/reserve.img $outdir/reserve/
	cp -v -r -p $outdir/reserve/* $working/system/reserve/ &> /dev/null
	sync
	umount -l $outdir/reserve
fi

if [ -f "$outdir/odm.img" ]; then
	echo "Merging odm . . . . "
	mkdir $outdir/odm
	mount -o ro $outdir/odm.img $outdir/odm/
	cp -v -r -p $outdir/odm/etc/odm_feature_list $working/system/etc/ &> /dev/null
	cp -v -r -p $outdir/odm/overlay/* $working/system/product/overlay/ &> /dev/null
	sync
	umount -l $outdir/odm
fi

if [ -f "$outdir/vendor.img" ]; then
	echo "Merging vendor overlays . . . . "
	mkdir $outdir/vendor
	mount -o ro $outdir/vendor.img $outdir/vendor/
	cp -v -r -p $outdir/vendor/overlay/oneplus_* $working/system/product/overlay/ &> /dev/null
	cp -v -r -p $outdir/vendor/overlay/VendorOverlay* $working/system/product/overlay/ &> /dev/null
	sync
	umount -l $outdir/vendor
fi

rm -rf $outdir

echo "Done"
