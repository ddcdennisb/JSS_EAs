#!/bin/bash
ccStatus=$(defaults read /Library/Preferences/com.apple.AssetCache Activated)
if [[ "$ccStatus" == 1 ]]; then
	echo "<result>Activated</result>"
else
	echo "<result>Not Activated</result>"
fi

exit 0