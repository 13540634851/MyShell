#!/bin/sh
adb_options=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
fi
echo "adb shell dumpsys activity | grep mResumedActivity"
#adb $adb_options shell dumpsys activity | grep "mFocusedActivity"
echo "adb shell dumpsys activity"
adb $adb_options shell dumpsys activity | grep "mResumedActivity"

