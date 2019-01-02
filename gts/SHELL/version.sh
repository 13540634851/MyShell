#!/bin/sh
aapt dump badging $1/$1.apk |grep "versionName="
