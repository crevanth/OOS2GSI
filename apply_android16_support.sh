#!/bin/bash

# Add Android 16 to supported versions in make.sh
sed -i 's/SUPPORTED_ANDROID=(\"10\" \"11\" \"12\" \"13\" \"14\")/SUPPORTED_ANDROID=(\"10\" \"11\" \"12\" \"13\" \"14\" \"16\")/' make.sh

# Insert Android 16 case block in url2GSI.sh
awk '/case "\$VERSION"/ {
    print;
    print "    16)";
    print "        echo \"⚠️ Android 16 (Vanilla Ice Cream) detected - experimental support enabled\"";
    print "        ;;";
    next
}1' url2GSI.sh > url2GSI.tmp && mv url2GSI.tmp url2GSI.sh

# Add OTA download check in url2GSI.sh
awk -v insert_line='FILENAME=$(basename "$OTA_URL")
if [ -f "$FILENAME" ]; then
    echo "✔️ OTA already downloaded: $FILENAME — skipping"
else
    echo "⏬ Downloading OTA: $FILENAME"
    wget -c "$OTA_URL" -O "$FILENAME" || { echo "❌ Download failed"; exit 1; }
fi' '
/OTA_URL="\$1"/ {
    print;
    print insert_line;
    next
}1' url2GSI.sh > temp && mv temp url2GSI.sh
