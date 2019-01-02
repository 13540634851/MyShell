#!/bin/bash
#check the vendor and system properties, which must be same.

check_vendor_and_system_properties() {
  brand_name_system=("$(adb shell getprop "ro.product.brand")")
  brand_name_vendor=("$(adb shell getprop "ro.vendor.product.brand")")

  if [[ ""${brand_name_system} = ""${brand_name_vendor} ]]; then
result1="\033[32m 【PASS!!】 属性 ro.product.brand 与 ro.vendor.product.brand 匹配 {$brand_name_system}\n \033[0m"
  else
result1="\033[31m 【FAIL!!】 属性 ro.product.brand 与 ro.vendor.product.brand 不匹配 {$brand_name_system != $brand_name_vendor }\n  \033[0m"
  fi

#echo -e "\033[31m 红色字 \033[0m"
#echo -e "\033[32m 绿色字 \033[0m"
#echo -e "\033[36m 蓝色字 \033[0m"
  device_name_system=("$(adb shell getprop "ro.product.device")")
  device_name_vendor=("$(adb shell getprop "ro.vendor.product.device")")


  if [[ ""${device_name_system} = ""${device_name_vendor} ]]; then
result2="\033[32m 【PASS!!】 属性 ro.product.device 与 ro.vendor.product.device 匹配 {$device_name_system}\n  \033[0m"
  else
result2="\033[31m 【FAIL!!】 属性 ro.product.device 与 ro.vendor.product.device 不匹配 {$device_name_system != $device_name_vendor }\n  \033[0m"
  fi

  manufacturer_name_system=("$(adb shell getprop "ro.product.manufacturer")")
  manufacturer_name_vendor=("$(adb shell getprop "ro.vendor.product.manufacturer")")

  if [[ ""${manufacturer_name_system} = ""${manufacturer_name_vendor} ]]; then
    result3="\033[32m 【PASS!!】 属性 ro.product.manufacturer 与 ro.vendor.product.manufacturer 匹配 {$manufacturer_name_system}\n  \033[0m"
  else
    result3="\033[31m 【FAIL!!】 属性 ro.product.manufacturer 与 ro.vendor.product.manufacturer 不匹配 {$manufacturer_name_system != $manufacturer_name_vendor }\n  \033[0m"
  fi


  model_name_system=("$(adb shell getprop "ro.product.model")")
  model_name_vendor=("$(adb shell getprop "ro.vendor.product.model")")


  if [[ ""${model_name_system} = ""${model_name_vendor} ]]; then
    result4="\033[32m 【PASS!!】 属性 ro.product.model 与 ro.vendor.product.model 匹配 { $model_name_system }\n  \033[0m"
  else
    result4="\033[31m 【FAIL!!】 属性 ro.product.model 与 ro.vendor.product.model 不匹配! { $model_name_system != $model_name_vendor }\n  \033[0m"
  fi


  product_name_system=("$(adb shell getprop "ro.product.name")")
  product_name_vendor=("$(adb shell getprop "ro.vendor.product.name")")



  if [[ ""${product_name_system} = ""${product_name_vendor} ]]; then
    result5="\033[32m 【PASS!!】 属性 ro.product.name 与 ro.vendor.product.name 匹配 { "$product_name_system" }\n  \033[0m"
  else
    result5="\033[31m 【FAIL!!】 属性 ro.product.name 与 ro.vendor.product.name 不匹配! { "$product_name_system" != "$product_name_vendor" }\n  \033[0m"
  fi


echo -e "$result1"
echo -e "$result2"
echo -e "$result3"
echo -e "$result4"
echo -e "$result5"
}


check_sensor() {
sensor1=($(adb shell pm list features|grep android.hardware.sensor.compass))
sensor2=($(adb shell pm list features|grep android.hardware.sensor.accelerometer))
sensor3=($(adb shell pm list features|grep android.hardware.sensor.light))
sensor4=($(adb shell pm list features|grep android.hardware.sensor.proximity))
sensor5=($(adb shell pm list features|grep android.hardware.sensor.gyroscope))
sensor6=($(adb shell pm list features|grep android.hardware.sensor.stepcounter))
sensor7=($(adb shell pm list features|grep android.hardware.sensor.stepdetector))
sensor8=($(adb shell pm list features|grep android.hardware.usb.host))
sensor9=($(adb shell pm list features|grep android.hardware.fingerprint))
if [ -z $sensor1 ]; then
check_result1="\033[31m 【地磁M-Sensor】: 不支持!! \n  \033[0m"
else
check_result1="\033[32m 【地磁M-Sensor】: 支持 android.hardware.sensor.compass \n  \033[0m"
fi

if [ -z $sensor2 ]; then
check_result2="\033[31m 【加速计传感器G-Sensor】: 不支持!! \n  \033[0m"
else
check_result2="\033[32m 【加速计传感器G-Sensor】: 支持 android.hardware.sensor.accelerometer\n  \033[0m"
fi

if [ -z $sensor3 ]; then
check_result3="\033[31m 【光传感器light】: 不支持!! \n  \033[0m"
else
check_result3="\033[32m 【光传感器light】: 支持 android.hardware.sensor.light\n  \033[0m"
fi

if [ -z $sensor4 ]; then
check_result4="\033[31m 【距离传感器proximityr】: 不支持!! \n  \033[0m"
else
check_result4="\033[32m 【距离传感器proximityr】: 支持 android.hardware.sensor.proximity\n  \033[0m"
fi

if [ -z $sensor5 ]; then
check_result5="\033[31m 【陀螺仪gyroscope】: 不支持!! \n  \033[0m"
else
check_result5="\033[32m 【陀螺仪gyroscope】: 支持 android.hardware.sensor.gyroscope\n  \033[0m"
fi

if [ -z $sensor6 ]; then
check_result6="\033[31m 【计步器stepcounter】: 不支持!! \n  \033[0m"
else
check_result6="\033[32m 【计步器stepcounter】: 支持 android.hardware.sensor.stepcounter\n  \033[0m"
fi

if [ -z $sensor7 ]; then
check_result7="\033[31m 【步骤检测器stepdetector】: 不支持!! \n  \033[0m"
else
check_result7="\033[32m 【步骤检测器stepdetector】: 支持 android.hardware.sensor.stepdetector\n  \033[0m"
fi

if [ -z $sensor8 ]; then
check_result8="\033[31m 【OTG】: 不支持!! \n  \033[0m"
else
check_result8="\033[32m 【OTG】: 支持 android.hardware.usb.host\n  \033[0m"
fi

if [ -z $sensor9 ]; then
check_result9="\033[31m 【指纹fingerprint】: 不支持!! \n  \033[0m"
else
check_result9="\033[32m 【指纹fingerprint】: 支持 android.hardware.fingerprint\n  \033[0m"
fi

echo -e "$check_result1"
echo -e "$check_result2"
echo -e "$check_result3"
echo -e "$check_result4"
echo -e "$check_result8"
echo -e "$check_result9"
echo -e "$check_result5"
echo -e "$check_result6"
echo -e "$check_result7"
}

check_googlekey() {
googlekey_system=($(adb shell getprop "soter.teei.googlekey.status"))
display_size=("$(adb shell settings get secure display_density_forced)")
font_size=("$(adb shell settings get system font_scale)")
TimeFormat=("$(adb shell settings get system time_12_24)")
Language=("$(adb shell getprop | grep persist.sys.locale)")

if [ -z $googlekey_system ]; then
googlekey_system="\033[31m 【FAIL!!】 Android 8.0 googlekey: 未写入 \n  \033[0m"
fi

if [[ ""${googlekey_system} = "OK" ]]; then
googlekey_system="\033[32m 【PASS!!】 googlekey: ${googlekey_system} \n  \033[0m"
else
googlekey_system="\033[31m 【FAIL!!】 googlekey: FAIL!!\n  \033[0m"
fi
echo "-$display_size-"
if [ -z $display_size ]; then
display_size="\033[32m 【PASS!!】 display size set right! \n  \033[0m"
else
display_size="\033[31m 【FAIL!!】 display size need set default or normal!\n  \033[0m"
fi

if [[ ""${font_size} = "1.0" ]]; then
font_size="\033[32m 【PASS!!】 font size set right! \n  \033[0m"
else
font_size="\033[31m 【FAIL!!】 font size need set default or normal!\n  \033[0m"
fi

if [[ ""${TimeFormat} = "12" ]]; then
TimeFormat="\033[32m 【PASS!!】 Time Format set 12h right! \n  \033[0m"
else
TimeFormat="\033[31m 【FAIL!!】 Time Format need set 12h!\n  \033[0m"
fi

if [[ ""${Language} = "[persist.sys.locale]: [en-US]" ]]; then
Language="\033[32m 【PASS!!】 Language set right! \n  \033[0m"
else
Language="\033[31m 【FAIL!!】 Language need set en-US\n  \033[0m"
fi

echo -e "$googlekey_system"
echo -e "$display_size"
echo -e "$font_size"
echo -e "$TimeFormat"
echo -e "$Language"
}
## main 
adb wait-for-device

echo "********************************************基本属性检查**********************************************"
## serialno
serialno_system=($(adb shell getprop "ro.serialno"))
echo -e "\033[36m serialno: ${serialno_system}\n  \033[0m"

## wm size
wm_size=("$(adb shell wm size)")
echo -e "\033[36m ${wm_size}\n  \033[0m"

## hardware
hardware_system=($(adb shell getprop "ro.hardware"))
echo -e "\033[36m hardware: ${hardware_system}\n  \033[0m"

## build_date
build_date=("$(adb shell getprop "ro.build.date")")
echo -e "\033[36m build date: ${build_date}\n  \033[0m"

## custom_version
custom_version=("$(adb shell getprop "ro.custom.build.version")")
echo -e "\033[36m custom version: ${custom_version}\n  \033[0m"

## internal_version
internal_version=("$(adb shell getprop "ro.internal.build.version")")
echo -e "\033[36m internal version: ${internal_version}\n  \033[0m"

## fingerprint
fingerprint_system=($(adb shell getprop "ro.build.fingerprint"))
echo -e "\033[36m fingerprint: ${fingerprint_system}\n  \033[0m"

##gmsversion
gmsversion_system=($(adb shell getprop "ro.com.google.gmsversion"))
echo -e "\033[36m gmsversion: ${gmsversion_system}\n  \033[0m"

##clientidbase
clientidbase_system=($(adb shell getprop "ro.com.google.clientidbase"))
echo -e "\033[36m clientidbase: ${clientidbase_system}\n  \033[0m"

##security_patch
security_patch=($(adb shell getprop "ro.build.version.security_patch"))
echo -e "\033[36m security_patch: ${security_patch}\n  \033[0m"

##googlekey
check_googlekey_result=$(check_googlekey)
echo "$check_googlekey_result"
echo "********************************************Sensor 属性检查*********************************************"
##sensor
check_sensor_result=$(check_sensor)
echo "$check_sensor_result"

echo "*************************************Android 8.0 GSI 5项属性检查********************************************"
check_result=$(check_vendor_and_system_properties)
echo "$check_result"


