#!/bin/sh
LoggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

homeDir=$(dscl . read /Users/$LoggedInUser |grep NFSHomeDirectory | awk '{print $2}')

lastConnect=$(defaults read "$homeDir"/Library/Preferences/com.jamf.connect.sync LastSignIn | awk '{print $1 " " $2}')

echo "<result>$lastConnect</result>"