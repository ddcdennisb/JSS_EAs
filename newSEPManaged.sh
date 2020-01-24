#!/bin/sh

if [ -e "/Library/Application Support/Symantec/Silo/MES/SMC/data/state.xml" ]; then
serveraddress=$(xmllint --format "/Library/Application Support/Symantec/Silo/MES/SMC/data/state.xml" | grep "last_server" | head -n 1 | awk -F'>' '{print $2}' | awk -F'<' '{print $1}')
fi

if [ ! -z ${serveraddress} ]; then
result="${serveraddress}"
else
result="Unmanaged"
fi

echo "<result>$result</result>"