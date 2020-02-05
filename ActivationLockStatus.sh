#!/bin/sh

#Get Status
alStatus=$(/usr/sbin/system_profiler SPHardwareDataType | awk '/Activation Lock Status/{print $NF}')

echo "<result>$alStatus</result>"