#!/bin/bash

# Purpose: to grab iCloud Drive Desktop and Document Sync status.
# If Drive has been setup previously then values should be: "Enabled" or "Not Enabled"
# If Drive has NOT been set up previously then values will be: "iCloud Account Enabled, Drive Not Enabled" or "iCloud Account Disabled"

#Variable to determine major OS version
OSver="$(/usr/bin/sw_vers -productVersion | /usr/bin/cut -d . -f 2)"

#Determine OS is 10.12 or greater as Doc Sync is only available on 10.12+
if [ "$OSver" -ge "12" ]; then
    #Path to PlistBuddy
    plistBud="/usr/libexec/PlistBuddy"

    #Determine logged in user
    loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

    #Variable to determine status of iCloud Drive Desktop & Documents setting
    iCloudDesktop=$(defaults read /Users/$loggedInUser/Library/Preferences/com.apple.finder.plist FXICloudDriveDesktop)

    #Determine whether user is logged into iCloud
    if [[ -e "/Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist" ]]; then
        iCloudStatus=$("$plistBud" -c "print :Accounts:0:LoggedIn" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null )

        #Determine whether user has iCloud Drive enabled. Value should be either "False" or "True"
        if [[ "$iCloudStatus" = "true" ]]; then
            DriveStatus=$("$plistBud" -c "print :Accounts:0:Services:2:Enabled" /Users/$loggedInUser/Library/Preferences/MobileMeAccounts.plist 2> /dev/null )
            if [[ "$DriveStatus" = "true" ]]; then
                if [[ "$iCloudDesktop" = "1" ]]; then
                    DocSyncStatus="Enabled"
                else
                    DocSyncStatus="Not Enabled"
                fi
            fi
            if [[ "$DriveStatus" = "false" ]] || [[ -z "$DriveStatus" ]]; then
                DocSyncStatus="iCloud Account Enabled, Drive Not Enabled"
            fi
        fi
        if [[ "$iCloudStatus" = "false" ]] || [[ -z "$iCloudStatus" ]]; then
            DocSyncStatus="iCloud Account Disabled"
        fi
    else
        DocSyncStatus="iCloud Account Disabled"
    fi
else
    DocSyncStatus="OS Not Supported"
fi


/bin/echo "<result>$DocSyncStatus</result>"