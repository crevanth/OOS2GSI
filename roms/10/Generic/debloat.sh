#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rm -rf $1/product/app/CalendarGooglePrebuilt
rm -rf $1/product/app/CalculatorGooglePrebuilt
rm -rf $1/product/app/Chrome
rm -rf $1/product/app/Chrome-Stub
rm -rf $1/product/app/DevicePolicyPrebuilt
rm -rf $1/product/app/DiagnosticsToolPrebuilt
rm -rf $1/product/app/Drive
rm -rf $1/product/app/GoogleCamera
rm -rf $1/product/app/Photos
rm -rf $1/product/app/MarkupGoogle
rm -rf $1/product/app/MicropaperPrebuilt
rm -rf $1/product/app/ModuleMetadataGoogle
rm -rf $1/product/app/Maps
rm -rf $1/product/app/PrebuiltGmail
rm -rf $1/product/app/SoundAmplifierPrebuilt
rm -rf $1/product/app/Tycho
rm -rf $1/product/app/talkback
rm -rf $1/product/app/arcore
rm -rf $1/product/app/YouTubeMusicPrebuilt
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/Videos
rm -rf $1/product/priv-app/AmbientSensePrebuilt
rm -rf $1/product/priv-app/AndroidAutoStubPrebuilt
rm -rf $1/product/priv-app/AndroidMigratePrebuilt
rm -rf $1/product/priv-app/CarrierServices
rm -rf $1/product/priv-app/HelpRtcPrebuilt
rm -rf $1/product/priv-app/HotwordEnrollmentXGoogleRT5514P
rm -rf $1/product/priv-app/HotwordEnrollmentOKGoogleRT5514P
rm -rf $1/product/priv-app/MaestroPrebuilt
rm -rf $1/product/priv-app/MyVerizonServices
rm -rf $1/product/priv-app/ScribePrebuilt
rm -rf $1/product/priv-app/SafetyHubPrebuilt
rm -rf $1/product/priv-app/RecorderPrebuilt
rm -rf $1/product/priv-app/TurboPrebuilt
rm -rf $1/product/priv-app/TipsPrebuilt
rm -rf $1/product/priv-app/Velvet
