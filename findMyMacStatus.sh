#!/bin/bash

# Purpose: to grab Find My Mac status.
#Variable to determine major OS version
OSver="$(/usr/bin/sw_vers -productVersion | /usr/bin/cut -d . -f 2)"

#Determine OS is 10.12 or greater as Doc Sync is only available on 10.12+
if [ "$OSver" -ge "12" ]; then
    #Path to PlistBuddy
    plistBud="/usr/libexec/PlistBuddy"

    #Determine logged in user
    loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

    #Determine whether user is logged into iCloud
    if [[ -e "/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist" ]]; then
        iCloudStatus=$("$plistBud" -c "print :Accounts:0:LoggedIn" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null )

        #Determine whether user has iCloud Drive enabled. Value should be either "False" or "True"
        if [[ "$iCloudStatus" = "true" ]]; then
            findStatus=$("$plistBud" -c "print :Accounts:0:Services:12:Enabled" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null )
            if [[ "$findStatus" = "true" ]]; then
                findMacStatus="Enabled"
            else
                findMacStatus="Not Enabled"
            fi
            if [[ "$findStatus" = "false" ]] || [[ -z "$findStatus" ]]; then
                findMacStatus="iCloud Account Enabled, Find My Mac Not Enabled"
            fi
        fi
        if [[ "$iCloudStatus" = "false" ]] || [[ -z "$iCloudStatus" ]]; then
            findMacStatus="iCloud Account Disabled"
        fi
    else
        findMacStatus="iCloud Account Disabled"
    fi
else
    findMacStatus="OS Not Supported"
fi


/bin/echo "<result>$findMacStatus</result>"