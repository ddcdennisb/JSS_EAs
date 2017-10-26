#!/bin/sh
LoggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`


lastConnect=$(defaults read /Users/$LoggedInUser/Library/Preferences/com.apple.Enterprise-Connect dateLastConnected | awk '{print $1 " " $2}')

#lastConnected=$(date -j -f "%Y-%m-%d" "$lastConnect" "+%Y-%m-%d")

echo "<result>$lastConnect</result>"