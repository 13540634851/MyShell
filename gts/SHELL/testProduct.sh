#!/bin/sh
adb_options=" "
if [ "$1" = "-s" ]; then
  adb_options=""$1" "$2""
fi
adb $adb_options shell getprop|grep "ro.sf.lcd_density"


echo "====brand===="
adb $adb_options shell getprop|grep "ro.product.brand"
adb $adb_options shell getprop|grep "ro.vendor.product.brand"
echo "====device===="
adb $adb_options shell getprop|grep "ro.product.device"
adb $adb_options shell getprop|grep "ro.vendor.product.device"
echo "====manufacturer===="
adb $adb_options shell getprop|grep "ro.product.manufacturer"
adb $adb_options shell getprop|grep "ro.vendor.product.manufacturer"
echo "====model===="
adb $adb_options shell getprop|grep "ro.product.model"
adb $adb_options shell getprop|grep "ro.vendor.product.model"
echo "====name===="
adb $adb_options shell getprop|grep "ro.product.name"
adb $adb_options shell getprop|grep "ro.vendor.product.name"





