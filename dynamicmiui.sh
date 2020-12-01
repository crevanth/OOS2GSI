#!bin/bash

LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/cache"

echo Extracting Images...
mkdir -p $outdir
bash $LOCALDIR/zip2img.sh $1 $outdir
bash $LOCALDIR/zip2img.sh $1 $outdir -p

cd $outdir
# Make new dummy image
echo "Creating dummy image"
dd if=/dev/zero of=final.img bs=4k count=1048576
mkfs.ext4 final.img
tune2fs -c0 -i0 final.img

# Mount the two files
echo "Merging two images.."
mkdir old && mkdir product && mkdir system
mount final.img system
mount system.img -o ro old
mount product.img -o ro product

echo "Copying System Files . . . . "
cp -v -r -p old/* system/ &> /dev/null
sync
umount old
rmdir old
rm system.img
rm -rf system/system/product
mkdir system/system/product

echo "Copying Product File . . . . "
cp -v -r -p product/* system/system/product/ &> /dev/null
sync
umount product
rmdir product
rm product.img

cd $LOCALDIR
cp -r $outdir/system $LOCALDIR

# Clean up
echo "Cleaning up.."
umount $outdir/system
rm -rf $outdir

# Finalize
echo "Dynamic script done"
