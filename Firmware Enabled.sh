#!/bin/sh

#Get Status
firmwareStatus=$(firmwarepasswd -check)

#Pull out final word
status=$(echo "$firmwareStatus" | awk '/Enabled:/ {print $NF}')

echo "<result>$status</result>"