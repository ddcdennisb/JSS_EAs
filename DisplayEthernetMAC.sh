#!/bin/bash

services=$(networksetup -listnetworkserviceorder | grep 'Hardware Port: Display Ethernet')

while read line; do
    sname=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $2}')
    sdev=$(echo $line | awk -F  "(, )|(: )|[)]" '{print $4}')
    ifout=$(ifconfig $sdev | awk '/ether/{print $2}')
    
    echo "Service Name: "$sname
    echo "Service device: "$sdev
    echo "MAC: "$ifout
	      
done <<< "$(echo "$services")"
     echo "<result>$ifout</result>"