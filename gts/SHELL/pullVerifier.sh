#!/bin/sh
adb_options=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
fi
adb $adb_options pull /storage/emulated/0/verifierReports/
