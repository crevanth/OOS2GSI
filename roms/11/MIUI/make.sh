#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Disable setup wizard
echo "DEVICE_PROVISIONED=1" >> $1/build.prop
