#!/bin/sh
adb_options=" "
adb_file=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
  adb_file=""$3""
else
  adb_file=""$1""
fi

if [ "$adb_file" = "" ]; then
 echo "file empty"
 exit;
fi

apk=${adb_file##*app}
apk2=${apk:1}
apkdir=${adb_file##*system}
echo "adb $adb_options push $adb_file/$apk2.apk system$apkdir/"
echo "adb $adb_options push $adb_file/oat/arm/$apk2.odex system$apkdir/oat/arm/"
echo "adb $adb_options push $adb_file/oat/arm/$apk2.vdex system$apkdir/oat/arm/"
adb $adb_options push $adb_file/$apk2.apk system$apkdir/
adb $adb_options push $adb_file/oat/arm/$apk2.odex system$apkdir/oat/arm/
adb $adb_options push $adb_file/oat/arm/$apk2.vdex system$apkdir/oat/arm/
#adb reboot

