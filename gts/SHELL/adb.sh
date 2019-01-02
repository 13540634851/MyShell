#!/bin/sh
echo ""

echo "adb 命令指南"
echo "1.查看当前手机activity : adb shell dumpsys activity | grep mResumedActivity"
echo "2.导出MTKlog : adb  pull /storage/emulated/0/mtklog/"
echo "3.导出verifier : adb  pull /storage/emulated/0/verifierReports/"
echo "4.veriferi 1 : adb shell dpm set-device-owner 'com.android.cts.verifier/com.android.cts.verifier.managedprovisioning.DeviceAdminTestReceiver'"
echo "5.veriferi 2 : adb shell dpm set-device-owner 'com.android.cts.emptydeviceowner/.EmptyDeviceAdmin'"
echo "6.查看录制了哪些视频mp4 : adb shell ls /sdcard/DCIM/Camera/*mp4"

echo ""

