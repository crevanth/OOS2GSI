#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# small debloat
rm -rf $1/product_services/app/YouTube
rm -rf $1/product/app/YouTube
rm -rf $1/app/datastatusnotification
rm -rf $1/app/QAS_DVC_MSP_VZW
rm -rf $1/app/VZWAPNLib
rm -rf $1/app/ims
rm -rf $1/app/vzw_msdc_api
rm -rf $1/priv-app/CNEService
rm -rf $1/priv-app/DMService
rm -rf $1/priv-app/VzwOmaTrigger
rm -rf $1/priv-app/qcrilmsgtunnel
rm -rf $1/product/priv-app/ConnMO
rm -rf $1/product/priv-app/DCMO
rm -rf $1/product/priv-app/MyVerizonServices
rm -rf $1/product/priv-app/SprintDM
rm -rf $1/product/priv-app/SprintHM
rm -rf $1/product_services/priv-app/PrebuiltGmsCorePi/app_chimera
rm -rf $1/product/priv-app/PrebuiltGmsCoreQt/app_chimera
rm -rf $1/etc/permissions/com.google.android.camera.experimental2017.xml
#rm -rf $1/product/app/GoogleCamera
#rm -rf $1/product/app/NexusWallpapersStubPrebuilt2017
#rm -rf $1/product/app/WallpapersBReel2017rm -rf $1/product/priv-app/EuiccSupportPixel
rm -rf $1/product/priv-app/WfcActivation

# Fix Files-DocumentsUI
rm -rf $1/product/overlay/PixelDocumentsUIOverlay

# Some Unused Google Apps
#rm -rf $1/product/app/Music2
#rm -rf $1/product/app/Photos
#rm -rf $1/product/app/Videos

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
rm -rf $1/product/app/TrichromeLibrary
rm -rf $1/product/app/TrichromeLibrary-Stub
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
