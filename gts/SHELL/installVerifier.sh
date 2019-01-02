#!/bin/sh
adb_options=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
fi
echo $adb_options
echo "install CtsVerifier.apk"
adb $adb_options install $PWD/CtsVerifier.apk
echo "install CtsPermissionApp.apk"
adb $adb_options install $PWD/CtsPermissionApp.apk

echo "install CtsVerifierUSBCompanion.apk"
adb $adb_options install $PWD/CtsVerifierUSBCompanion.apk

echo "install NotificationBot.apk"
adb $adb_options install $PWD/NotificationBot.apk
