#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Delete Google stuff
rm -rf $1/app/ARCore_stub
rm -rf $1/product/app/Calculator
rm -rf $1/product/app/Drive
rm -rf $1/product/app/Maps
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/CalendarGoogle
rm -rf $1/product/app/Duo
rm -rf $1/product/app/GooglePay
rm -rf $1/product/app/Music2
rm -rf $1/product/app/Gmail2
rm -rf $1/product/app/GoogleTTS
rm -rf $1/product/app/Videos
rm -rf $1/product/app/Chrome
rm -rf $1/product/app/Photos
rm -rf $1/product/app/talkback
rm -rf $1/product/priv-app/AndroidAutoStub
rm -rf $1/product/priv-app/HotwordEnrollmentOKGoogleWCD9340
rm -rf $1/product/priv-app/HotwordEnrollmentXGoogleWCD9340
rm -rf $1/product/priv-app/LiveCaption
rm -rf $1/product/priv-app/Turbo
rm -rf $1/product/priv-app/Velvet
rm -rf $1/product/priv-app/Wellbeing
rm -rf $1/system_ext/priv-app/GoogleFeedback
rm -rf $1/system_ext/priv-app/TagGoogle

# Delete OnePlus stuff
rm -rf $1/app/OPYellowpage
rm -rf $1/reserve/OPForum
rm -rf $1/reserve/OPNote
rm -rf $1/reserve/OPWallpaperResources
rm -rf $1/reserve/OnePlusPods
rm -rf $1/reserve/card
rm -rf $1/reserve/OPBackupRestore
rm -rf $1/reserve/OPSoundRecorder
rm -rf $1/reserve/Weather
rm -rf $1/system_ext/app/OPBackup
rm -rf $1/system_ext/app/OPBreathMode
rm -rf $1/system_ext/app/OPBugReportLite
rm -rf $1/system_ext/app/OPCommonLogTool
rm -rf $1/system_ext/app/EngSpecialTest
rm -rf $1/system_ext/app/EngineeringMode
rm -rf $1/system_ext/app/OPEngMode
rm -rf $1/system_ext/app/PhotosOnline
rm -rf $1/system_ext/app/NQNfcNci
rm -rf $1/system_ext/priv-app/OPAod
rm -rf $1/system_ext/priv-app/OnePlusCamera
rm -rf $1/system_ext/priv-app/OPDeviceManager
rm -rf $1/system_ext/priv-app/OnePlusGallery
rm -rf $1/system_ext/priv-app/OpLogkit
rm -rf $1/system_ext/priv-app/QuickAccessWallet

# H2OS stuff
rm -rf $1/app/By_*
rm -rf $1/priv-app/By_*
rm -rf $1/reserve/By_*
rm -rf $1/product/app/By_*
rm -rf $1/product/priv-app/By_*
rm -rf $1/system_ext/app/By_*
rm -rf $1/system_ext/priv-app/By_*

# Fix oos ril
rm -rf $1/system_ext/framework/qti-telephony-common.jar
rm -rf $1/system_ext/framework/op-telephony-common.jar
