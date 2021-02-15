#!/bin/bash
#Written By @nnippon!, thanks for tools for help me make it ez

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
payload_extractor="$LOCALDIR/payload/payload_dumper.py"
outdir="$LOCALDIR/cache"
tmpdir="$LOCALDIR/cache/tmp"

echo "Creating folders to start process . . . . "
	mkdir -p "$outdir"
	mkdir -p "$tmpdir"
        mkdir working && mkdir working/system
        mkdir system-old

echo "Extracting ROM zip process started, will take some time . . . . "
if [ $1 = "Generic" ]; then
        echo "Generic OTA Detected, Extracting . . . . "
        unzip $2 -d $tmpdir &> /dev/null
        if [ -f "$tmpdir/payload.bin" ]
        then
        python $payload_extractor --out $outdir $tmpdir/payload.bin &> /dev/null
        else
        bash $LOCALDIR/zip2img.sh $2 $outdir
        fi
        mv $outdir/system.img $outdir/system-old.img
elif [ $1 = "MIUI" ]; then
        echo "MIUI OTA Detected, Extracting . . . . "
	unzip $2 -d $tmpdir &> /dev/null
        if [ -f "$tmpdir/payload.bin" ]
        then
        python $payload_extractor --out $outdir $tmpdir/payload.bin &> /dev/null
        else
        bash $LOCALDIR/zip2img.sh $2 $outdir
        fi
	mv $outdir/system.img $outdir/system-old.img
elif [ $1 = "OxygenOS" ]; then
        echo "OnePlus OTA Detected, Extracting . .  . ."
        unzip $2 -d $tmpdir &> /dev/null
        python $payload_extractor --out $outdir $tmpdir/payload.bin &> /dev/null
        mv $outdir/system.img $outdir/system-old.img
elif [ $1 = "Pixel" ]; then
        echo "Pixel OTA Detected, Extracting . . . . "
        unzip $2 -d $tmpdir &> /dev/null
	unzip $tmpdir/*/*.zip -d $tmpdir &> /dev/null
	simg2img $tmpdir/system.img $outdir/system-old.img
        simg2img $tmpdir/system_other.img $outdir/system_other.img
	if [ -f "$tmpdir/product.img" ]; then
        simg2img $tmpdir/product.img $outdir/product.img
        fi
 	if [ -f "$tmpdir/system_ext.img" ]; then
	simg2img $tmpdir/system_ext.img $outdir/system_ext.img
	fi
fi

echo "Clear temp folder . . . . "
rm -rf $tmpdir

echo "Done extract, continue . . . . "
echo "Creating 4GB empty image to fit merging . . . . "

dd if=/dev/zero of=system.img bs=4k count=1048576
mkfs.ext4 system.img
tune2fs -c0 -i0 system.img

echo "Done, merge process started, will take some time . . . . "
echo "Merging system . . . . "
	mount -o loop system.img working/system/
	mount -o ro $outdir/system-old.img system-old/
	cp -v -r -p system-old/* working/system/ &> /dev/null
        sync
	umount -l system-old
if [ -f "$outdir/product.img" ]; then
echo "Merging product . . . . "
        rm -rf working/system/product
        ln -s working/system/product working/system/product
        rm -rf working/system/system/product
        mkdir working/system/system/product
	mkdir $outdir/product
	mount -o ro $outdir/product.img $outdir/product
	cp -v -r -p $outdir/product/* working/system/system/product/ &> /dev/null
	sync
        umount -l $outdir/product
fi
if [ -f "$outdir/system_ext.img" ]; then
echo "Merging system_ext . . . . "
        mkdir $outdir/system_ext
        mount -o ro $outdir/system_ext.img $outdir/system_ext/
        rm -rf working/system/system_ext
        rm -rf working/system/system/system_ext
        mkdir working/system/system/system_ext
        ln -s working/system/system_ext working/system/system_ext
        cp -v -r -p $outdir/system_ext/* working/system/system/system_ext/ &> /dev/n$
        sync
        umount -l $outdir/system_ext
fi
if [ $1 = "OxygenOS" ]; then
     if [ -f "$outdir/opproduct.img" ]; then
	echo "Merging opproduct . . . . "
	mkdir $outdir/opproduct
	mount -o ro $outdir/opproduct.img $outdir/opproduct/
	cp -v -r -p $outdir/opproduct/* working/system/oneplus/ &> /dev/null
	sync
        umount -l $outdir/opproduct
     fi
     if [ -f "$outdir/reserve.img" ]; then
	echo "Merging reserve . . . . "
        rm -rf working/system/system/reserve
        mkdir working/system/system/reserve
	mkdir $outdir/reserve
	mount -o ro $outdir/reserve.img $outdir/reserve/
	cp -v -r -p $outdir/reserve/* working/system/system/reserve/ &> /dev/null
	sync
        umount -l $outdir/reserve
     fi
     if [ -f "$outdir/india.img" ]; then
	echo "Merging india . . . . "
        rm -rf working/system/system/india
        mkdir working/system/system/india
	mkdir $outdir/india
	mount -o ro $outdir/india.img $outdir/india/
	cp -v -r -p $outdir/india/* working/system/system/india/ &> /dev/null
	sync
        umount -l $outdir/india
     fi
echo "Merging overlays . . . . "
	mkdir $outdir/vendor
	mount -o ro $outdir/vendor.img $outdir/vendor/
	cp -r $outdir/vendor/overlay $outdir
	rm -rf $outdir/overlay/*.apk
	cp -v -r -p $outdir/overlay/* working/system/system/product/overlay/ &> /dev/null
	sync
	umount -l $outdir/vendor
elif [ $1 = "Pixel" ]; then
echo "Merging system_other . . . . "
	mkdir $outdir/system_other
	mount -o ro $outdir/system_other.img $outdir/system_other/
	cp -v -r -p $outdir/system_other/* working/system/system/ &> /dev/null
	sync
        umount -l $outdir/system_other
fi

echo "Merge partitions done, clear cache . . . . "
rm -rf $outdir

echo "Done, now ready to build as GSI!"
