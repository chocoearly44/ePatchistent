#!/bin/bash
source .env

rm eapatch.apk

echo "Packaging app"
apktool b easistent_src -o eapath_temp.apk

echo ""

echo "Aligning app"
$ZIPALIGN_PATH -p 4 eapath_temp.apk eapatch.apk

echo "Verifying alignment"
$ZIPALIGN_PATH -c 4 eapatch.apk

echo ""

echo "Signing app"
$APKSIGNER_PATH sign --ks debug_store.jks  --ks-pass pass:123456 --ks-key-alias key0 eapatch.apk

echo "Verifying signature"
$APKSIGNER_PATH verify eapatch.apk

rm eapath_temp.apk
rm eapatch.apk.idsig
