#!/bin/sh
adb_options=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
fi
adb $adb_options shell dpm set-device-owner 'com.android.cts.emptydeviceowner/.EmptyDeviceAdmin'

