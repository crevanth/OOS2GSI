#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rm -rf $1/reserve/OPForum
rm -rf $1/reserve/OPCommunity
rm -rf $1/product/app/Calculator
rm -rf $1/product/app/Drive
rm -rf $1/product/app/Duo
rm -rf $1/product/app/Gmail2
rm -rf $1/product/app/GooglePay
rm -rf $1/product/app/Maps
# rm -rf $1/product/app/PowerOffAlarm
rm -rf $1/product/app/Videos
rm -rf $1/product/app/Photos
rm -rf $1/product/app/YTMusic
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/talkback

rm -rf $1/system_ext/app/NQNfcNci
rm -rf $1/system_ext/app/OPBugReportLite

rm -rf $1/priv-app/OnePlusCamera


# Fuck off Netflix and facebook
rm -rf $1/reserve/By_*
rm -rf $1/priv-app/By_*
rm -rf $1/app/By_*

# Temp fix for ril
rm -rf $1/system_ext/framework/qti-telephony-common.jar
rm -rf $1/system_ext/framework/op-telephony-common.jar
